class Syndication < ApplicationRecord
  belongs_to :post

  validates :name, presence: true
  validates :url,  presence: true
end
