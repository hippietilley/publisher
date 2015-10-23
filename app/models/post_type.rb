class PostType < ActiveRecord::Base
  self.abstract_class = true

  before_create :set_slug
  before_update :set_slug
  validates :slug, uniqueness: true

  default_scope { order("published_at DESC") }

  def self.inherited(child)
    child.class_eval do
      scope :invisible, -> { where(private: true) }
      scope :visible, -> { where(private: false) }
    end
    super
  end

  def self.set_fallback_attr(attr)
    @fallback_attr = attr
    validates @fallback_attr, presence: true
  end

  def self.fallback_attr
    @fallback_attr
  end

  def name
    if title && subtitle
      "#{title} : #{subtitle}"
    elsif title
      title
    else
      fallback_name
    end
  end

  def fallback_name
    fallback_attribute.split("/").last.split(".").first
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

  def fallback_attribute
    self.send(self.class.fallback_attr)
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
    self.slug = name.present? ? name : fallback_attribute if slug.blank?
    clean_slug!
  end

end
