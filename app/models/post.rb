class Post < ActiveRecord::Base
  belongs_to :post_type, polymorphic: true
  default_scope { order("published_at DESC") }

  validates :slug, uniqueness: true
  delegate :name, to: :post_type

  def user
    User.first
  end

  def type
    self.post_type_type.downcase
  end

  def microformat
    type == "event" ? "h-event" : "h-entry"
  end

  def namespace
    type.pluralize
  end

  def path
    # starts with nil to ensure a leading slash
    if type == "page"
      [nil, slug]
    else
      [nil,
       namespace,
       published_at.year,
       published_at.month,
       published_at.day,
       slug
      ]
    end.join("/")
  end

  def public?
    !private?
  end

  def tags
    output = []
    Tagging.where(post_type: post_type_type.try(:downcase), post_id: post_type_id).all.find_each do |tagging|
      output << Tag.find(tagging.tag_id)
    end
    output
  end

end
