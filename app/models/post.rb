class SlugValidator < ActiveModel::Validator
  def validate(record)
    if record.slug_exists?
      record.errors[:slug] << 'needs to be unique on the published date'
    end
  end
end

class Post < ActiveRecord::Base
  belongs_to :post_type, polymorphic: true
  default_scope { order("published_at DESC") }
  before_validation :generate_slug, on: :create
  validates_with SlugValidator

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
           to: :post_type

  scope :invisible, -> { where(private: true)  }
  scope :visible,   -> { where(private: false) }
  scope :of,    lambda { |klass| where(post_type_type: klass.to_s.camelcase) }
  scope :on,    lambda { |date| where("published_at BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day) }

  def user
    User.first
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
       published_at.month,
       published_at.day,
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
    Tagging.where(post_type: post_type_type.try(:downcase), post_id: post_type_id).all.find_each do |tagging|
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
      content[0,50]
    end
  end

  def slug_exists?
    Post.on(published_at).where(post_type_type: post_type_type, slug: slug).exists?
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
