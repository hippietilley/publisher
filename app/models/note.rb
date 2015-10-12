class Note < ActiveRecord::Base
  before_create :set_slug
  before_update :set_slug
  validates :content, presence: true

  def name
    pieces = content[0..50].split
    if pieces.length == 1
      pieces
    else
      pieces[0..-1].join(" ")
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

  def title
    content
  end

  private

  def set_slug
    blank       = ""
    separator   = "-"
    if self.slug.blank?
      self.slug = name.present? ? name : content
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
