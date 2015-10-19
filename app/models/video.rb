class Video < ActiveRecord::Base
  before_create :set_slug
  before_update :set_slug
  validates :enclosure_url, presence: true
  validates :slug, uniqueness: true

  default_scope { order("published_at DESC") }
  scope :invisible, -> { where(private: true) }
  scope :visible, -> { where(private: false) }

  def name
    if title && subtitle
      "#{title} : #{subtitle}"
    elsif title
      title
    else
      enclosure_url.split("/").last.split(".").first
    end
  end

  def path
    [nil,
     self.class.to_s.downcase.pluralize,
     published_at.year,
     published_at.month,
     published_at.day,
     slug
    ].join("/")
  end

  def params
    {year: published_at.year, month: published_at.month, day: published_at.day, slug: slug}
  end

  def public?
    !private?
  end

  private

  def clean_slug!
    blank     = ""
    separator = "-"
    self.slug = slug.downcase
      .gsub(/\(|\)|\[|\]\./, blank)
      .gsub(/&amp;/,         blank)
      .gsub(/\W|_|\s|-+/,    separator)
      .gsub(/^-+/,           blank)
      .gsub(/-+$/,           blank)
  end

  def set_slug
    self.slug = name.present? ? name : enclosure_url if slug.blank?
    clean_slug!
  end
end
