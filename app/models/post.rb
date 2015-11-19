class Post < ActiveRecord::Base
  belongs_to :post_type, polymorphic: true

  validates :slug, uniqueness: true
  delegate :name, to: :post_type

  def user
    User.first
  end
  def path
    [nil,
     self.post_type_type.downcase.pluralize,
     published_at.year,
     published_at.month,
     published_at.day,
     slug
    ].join("/")
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
