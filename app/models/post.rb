class SlugValidator < ActiveModel::Validator
  def validate(record)
    if record.new_record? && record.slug_exists?
      record.errors[:slug] << "needs to be unique on the published date"
    end
  end
end

class Post < ActiveRecord::Base
  include Twitter::Autolink

  belongs_to :user
  belongs_to :post_type, polymorphic: true
  has_many :syndications

  default_scope { order("published_at DESC") }
  before_validation :generate_slug, on: :create
  validates_with SlugValidator

  after_create :create_syndication_for_instagram
  after_update :create_syndication_for_instagram

  delegate :name,
           :bookmark_author,
           :bookmark_excerpt,
           :bookmark_url,
           :organizer_name,
           :organizer_url,
           :location_name,
           :location_url,
           :location_street_address,
           :location_extended_street_address,
           :location_locality,
           :location_region,
           :location_country,
           :location_postal_code,
           :location_latitude,
           :location_longitude,
           :location_altitude,
           :starts_at,
           :ends_at,
           :show_in_nav,
           :image_url,
           :width,
           :height,
           :duration,
           :captured_at,
           :enclosure_url,
           :summary,
           :show_in_nav,
           :activity_type,
           :activity_verb,
           :amount,
           :unit,
           :converted_amount,
           :converted_unit,
           to: :post_type

  scope :invisible, -> { where(private: true)  }
  scope :visible,   -> { where(private: [false, nil]) }
  scope :of,       lambda { |klass| where(post_type_type: klass.to_s.singularize.camelcase) }
  scope :on,       lambda { |date| where("published_at BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day) }

  def self.for_user(user)
    user ? all : visible
  end

  def type
    self.post_type_type.downcase
  end

  def microformat
    type == "event" ? "h-event" : "h-entry"
  end

  def namespace
    type.pluralize
  end

  def path
    # starts with nil to ensure a leading slash
    if type == "page"
      [nil, slug]
    else
      [nil,
       namespace,
       published_at.year,
       published_at.month.to_s.rjust(2, "0"),
       published_at.day.to_s.rjust(2, "0"),
       slug
      ]
    end.join("/")
  end

  def to_partial_path
    "#{post_type_type.downcase.pluralize}/#{post_type_type.downcase}"
  end

  def public?
    !private?
  end

  def params
    {year: published_at.year, month: published_at.month, day: published_at.day, slug: slug}
  end

  def tags
    output = []
    Tagging.where(post_id: post_type_id).all.find_each do |tagging|
      output << Tag.find(tagging.tag_id)
    end
    output
  end

  def name
    if title && subtitle
      "#{title} : #{subtitle}"
    elsif title
      title
    elsif content
      content[0,150]
    elsif post_type.activity_type && post_type.amount && post_type.unit
      "#{post_type.activity_type} : #{post_type.amount} #{post_type.unit}"
    end
  end

  def syndication_content
    pieces = []

    @syndication_content ||= if post_type.respond_to? :syndication_content
      body = post_type.syndication_content
    else
      body = name
    end

    # DOC : curl https://dev.twitter.com/rest/reference/get/help/configuration | grep url_length
    # 140 : tweet max length
    #  23 : t.co URL length
    #   2 : line breaks between content and URL
    #   3 : elipsis
    # 112 : 140 - 23 - 2 - 3
    # Truncate tweet content if neccesary to make room for permalink
    if body.length > 140
      ["#{body[0..111]}...", url].join("\n\n")
    else
      body
    end
  end

  def url
    Setting.of(:protocol).content + Setting.of(:domain).content + path
  end

  def slug_exists?
    Post.on(published_at).where(post_type_type: post_type_type, slug: slug).exists?
  end

  def linked_content
    auto_link(content,
              suppress_no_follow: true,
              link_text_block: Proc.new{ |entity, text|
                text = text.
                       gsub(/^.*:\/\//, ""). # removes leading protocol
                       gsub(/^www\./,   ""). # removes leading www
                       gsub(/\/$/,      "")  # removes trailing slash
              }
    ).html_safe
  end


  # media embeds
  def vines
    html_doc = Nokogiri::HTML(linked_content)
    photos = []

    html_doc.css("a").each do |link|
      if link.attr(:href) =~ /vine.co/
        photos << { video_id: link.attr(:href).split("/").last }
      end
    end

    photos
  end

  def youtubes
    html_doc = Nokogiri::HTML(linked_content)
    videos = []

    html_doc.css("a").each do |link|
      if link.attr(:href) =~ /youtube.com/
        videos << { video_id: link.attr(:href).split("v=").last }
      elsif link.attr(:href) =~ /youtu.be/
        videos << { video_id: link.attr(:href).split("/").last }
      end
    end

    videos
  end

  def vimeos
    html_doc = Nokogiri::HTML(linked_content)
    videos = []

    html_doc.css("a").each do |link|
      url = link.attr(:href)
      if url =~ /vimeo.com/
        videos << { video_id: url.gsub(/player.vimeo.com\/video/, "vimeo.com").split("vimeo.com/").last }
      end
    end

    videos
  end

  def twitters
    html_doc = Nokogiri::HTML(linked_content)
    tweets = []

    html_doc.css("a").each do |link|
      url = link.attr(:href)

      if url =~ /twitter.com\/\w+\/status\/\d+/
        tweets << { tweet_url: url }
      end
    end

    tweets
  end

  def instagrams
    html_doc = Nokogiri::HTML(linked_content)
    photos = []

    html_doc.css("a").each do |link|
      if link.attr(:href) =~ /instagram.com/
        photos << { photo_id: link.attr(:href).split("/").last }
      end
    end

    photos
  end

  def thisismyjams
    html_doc = Nokogiri::HTML(linked_content)

    jams = []

    html_doc.css("a").each do |link|
      url = link.attr(:href)

      if url =~ /t.thisismyjam.com/
        jam_id = url.split("t.thisismyjam.com").compact.last.split("/")[2]

        api_url      = "http://api.thisismyjam.com/1/jams/#{jam_id}.json"
        api_response = JSON.load(open(api_url))

        jams << {
          title:     api_response["jam"]["title"],
          artist:    api_response["jam"]["artist"],
          image_url: api_response["jam"]["jamvatarLarge"],
          embed_url: api_response["jam"]["viaUrl"]
        }
      end
    end

    jams
  end

  def images
    html_doc = Nokogiri::HTML(linked_content)
    photos = []

    html_doc.css("a").each do |link|
      extension = URI.parse(link.attr(:href)).path.split(".").last

      if extension.try(:downcase) =~ /^jpg|jpeg|png|gif|bmp$/
        photos << { url: link.attr(:href) }
      end
    end

    photos
  end

  def videos
    html_doc = Nokogiri::HTML(linked_content)
    videos = []

    html_doc.css("a").each do |link|
      extension = link.attr(:href).split(".").last

      if extension.downcase =~ /^[mp4|avi|mov|ogv|webm|m4v|3gp|m3u8]$/
        videos << { url: link.attr(:href) }
      end
    end

    videos
  end

  def audios
    html_doc = Nokogiri::HTML(linked_content)
    audios = []

    html_doc.css("a").each do |link|
      extension = link.attr(:href).split(".").last

      if extension.downcase =~ /^[mp3|aac|wav|ogg|oga|m4a]$/
        audios << { url: link.attr(:href) }
      end
    end

    audios
  end

  def flickrs
    html_doc = Nokogiri::HTML(linked_content)
    photos = []

    html_doc.css("a").each do |link|
      url = link.attr(:href)
      next if url =~ /\/sets\//

      if url =~ /flickr.com|flic.kr/

        if url =~ /tags/
          next
        else url =~ /flickr.com/
          url = url.sub("flickr.com",               "flickr.com/photos")
          url = url.sub("flickr.com/photos/photos", "flickr.com/photos")

          oembed = Nokogiri::XML(open("https://www.flickr.com/services/oembed?url=#{url}"))

          photos << {
            image_url:         oembed.css("oembed url").text,
            page_url:          oembed.css("oembed web_page").text,
            photographer_name: oembed.css("oembed author_name").text,
            photographer_url:  oembed.css("oembed author_url").text,
            title:             oembed.css("oembed title").text,
            width:             oembed.css("oembed width").text,
            height:            oembed.css("oembed height").text
          }
        end

      end
    end

    photos
  end

  def create_syndication_for_instagram
    unless instagrams.blank?
      instagrams.each do |instagram|
        url = "https://instagram.com/p/#{instagram[:photo_id]}"
        create_syndication_for(name: :instagram, url: url)
      end
    end
  end

  def create_syndication_for(name: syndication_name, url: syndication_url)
    self.syndications.find_or_create_by(name: syndication_name.to_s.capitalize, url: syndication_url)
  end

  private

  def clean_slug!(slug)
    blank     = ""
    separator = "-"
    self.slug = slug.downcase
      .gsub(/\(|\)|\[|\]\./, blank)
      .gsub(/&amp;/,         blank)
      .gsub(/\W|_|\s|-+/,    separator)
      .gsub(/^-+/,           blank)
      .gsub(/-+$/,           blank)
      .gsub(/-+/,            separator)
  end

  def generate_slug
    n = 0
    self.slug = name || post_type_type if self.slug.blank?
    clean_slug!(self.slug)
    while slug_exists?
      self.slug = name || post_type_type
      n += 1
      clean_slug!(self.slug + "-#{n}")
    end
  end
end
