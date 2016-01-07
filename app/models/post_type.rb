class PostType < ActiveRecord::Base
  has_one :post, as: :post_type
  self.abstract_class = true
end
