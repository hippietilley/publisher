class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :posts, through: :taggings

  before_create :set_slug
  before_update :set_slug

  validates :slug, uniqueness: true
  validates :name, presence: true, uniqueness: true

  def private_tag?
    name.match(/^\./)
  end

  def display(attribute)
    val = self.send(attribute)

    # wrap in quotes if there spaces in the name, slugs don't need quotes
    if val =~ / /
      val = "'#{val}'"
    end

    machine_tag? ? machine_tag_prefix + val : val
  end

  private
  
  def machine_tag?
    namespace.present? && predicate.present?
  end
  
  def machine_tag_prefix
    "#{namespace}:#{predicate}="
  end

  # TODO: DRY refactor this method copied from PostType into a lib?
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

  def set_slug
    self.slug = name if slug.blank?
    clean_slug!(self.slug)
  end
end
