class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings

  before_create :set_slug
  before_update :set_slug

  validates :slug, uniqueness: true
  validates :name, presence: true, uniqueness: true
  
  def to_param
    slug
  end

  def path
    "/tags/#{slug}"
  end

  def public_tag?
    !private_tag?
  end

  def private_tag?
    name.match(/^\./)
  end

  def display(attribute)
    val = self.send(attribute)

    # wrap in quotes if there spaces in the name, slugs don't need quotes
    if attribute == :name && !namespace.blank? && !predicate.blank?
      if val =~ / /
        val = "'#{val}'"
      end
    end

    machine_tag? ? machine_tag_prefix + val : val
  end
  
  def machine_tag?
    namespace.present? && predicate.present?
  end

  private
  
  def machine_tag_prefix
    "#{namespace}:#{predicate}="
  end

  # TODO: DRY refactor this method copied from PostType into a lib?
  def clean_slug!(slug)
    if machine_tag?
      slug = machine_tag_prefix + slug
    end

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
    clean_slug!(name)
  end
end
