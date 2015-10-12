class Photo < ActiveRecord::Base
  before_create :set_slug
  before_update :set_slug
  validates :image_url, presence: true

  def name
    if title && subtitle
      "#{title} : #{subtitle}"
    elsif title
      title
    else
      image_url.split("/").last.split(".").first
    end
  end

  def path
    [nil,
     self.class.to_s.downcase.pluralize,
     self.published_at.year,
     self.published_at.month,
     self.published_at.day,
     self.slug
    ].join("/")
  end

  def public?
    !self.private?
  end

  private

  def set_slug
    blank       = ""
    separator   = "-"
    if self.slug.blank?
      self.slug = name.present? ? name : image_url
    end
    self.slug   = slug.downcase.
      gsub(/\(|\)|\[|\]\./, blank).
      gsub(/&amp;/,         blank).
      gsub(/\W+/,           separator).
      gsub(/_+/,            separator).
      gsub(/ +/,            separator).
      gsub(/-+/,            separator).
      gsub(/^-+/,           blank).
      gsub(/-+$/,           blank)
  end
end
