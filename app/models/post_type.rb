class PostType < ActiveRecord::Base
  has_one :post, as: :post_type
  delegate :path,
           :namespace,
           :private,
           :private?,
           :public,
           :public?,
           :in_reply_to,
           :in_reply_to?,
           :published_at,
           :slug,
           :title,
           :subtitle,
           :content,
           :tags,
           :type,
           to: :post,
           allow_nil: true

  self.abstract_class = true

  class << self
    attr_reader :fallback_attribute
  end

  belongs_to :user

  def to_partial_path
    "#{self.class.to_s.downcase.pluralize}/#{self.class.to_s.downcase}"
  end

  def user
    User.first
  end

  def post_type
    self
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

  def self.inherited(child)
    child.class_eval do
      scope :invisible, -> { includes(:post).where(posts: {private: true}) }
      scope :visible, -> { includes(:post).where(posts: {private: false}) }
    end

    super
  end

  def self.fallback_attr(attr)
    @fallback_attribute = attr
    # validates @fallback_attribute, presence: true
  end

  def fallback_name
    fallback_attribute.split("/").last.split(".").first
  end

  def params
    {year: published_at.year, month: published_at.month, day: published_at.day, slug: slug}
  end

  def fallback_column
    self.class.fallback_attribute
  end

  def fallback_attribute
    send(fallback_column)
  end

  def clean_slug!(slug)
    blank     = ""
    separator = "-"
    slug = slug.to_s.downcase
      .gsub(/\(|\)|\[|\]\./, blank)
      .gsub(/&amp;/,         blank)
      .gsub(/\W|_|\s|-+/,    separator)
      .gsub(/^-+/,           blank)
      .gsub(/-+$/,           blank)
      .gsub(/-+/,            separator)
  end

  def generate_slug
    if self.type == "page"
      slug = (title || fallback_attribute) if slug.blank?
    else
      slug = name.present? ? name : fallback_attribute if slug.blank?
    end

    clean_slug!(slug)
  end
end
