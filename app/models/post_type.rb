class PostType < ApplicationRecord
  has_one :post, as: :post_type, dependent: :destroy
  self.abstract_class = true
end
