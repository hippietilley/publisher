class PostType < ApplicationRecord
  has_one :post, as: :post_type
  self.abstract_class = true
end
