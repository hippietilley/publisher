class PostType < ActiveRecord::Base
  has_one :post, as: :post_type
  delegate :path,
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
           to: :post,
           allow_nil: true

  self.abstract_class = true

  class << self
    attr_reader :fallback_attribute
  end

  belongs_to :user

  def user
    User.first
  end

  def post_type
    self
  end


end
