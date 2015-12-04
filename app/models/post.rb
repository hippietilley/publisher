class Post < ActiveRecord::Base
  belongs_to :post_type, polymorphic: true
  before_validation :generate_slug, on: :create
  validates :slug, uniqueness: true
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
           to: :post_type

  scope :invisible, -> { where(private: true)  }
  scope :visible,   -> { where(private: false) }
  scope :of,    lambda { |klass| where(post_type_type: klass.to_scamelcase) }

  def user
    User.first
  end

  def path
    [nil,
     self.post_type_type.downcase.pluralize,
     published_at.year,
     published_at.month,
     published_at.day,
     slug
    ].join("/")
  end

  def public?
    !private?
  end

  def params
    {year: published_at.year, month: published_at.month, day: published_at.day, slug: slug}
  end

  def tags
    output = []
    Tagging.where(post_type: self.class.to_s.downcase, post_id: id).all.find_each do |tagging|
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
    self.slug = title.present? ? name : post_type_type if self.slug.blank?
    clean_slug!(self.slug)
  end


end
