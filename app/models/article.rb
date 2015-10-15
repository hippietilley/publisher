class Article < ActiveRecord::Base
  before_create :set_slug
  before_update :set_slug
  validates :content, presence: true

  def name
    if title && subtitle
      "#{title} : #{subtitle}"
    elsif title
      title
    else
      content[0..50].split[0..-2].join(" ")
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
    self.slug = name.present? ? name : content if slug.blank?
    clean_slug!
  end

end
