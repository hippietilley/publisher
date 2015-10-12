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
    if self.slug.blank?
      self.slug = self.title.gsub(/\'|\"/, "").parameterize
    end
  end
end
