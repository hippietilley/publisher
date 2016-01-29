class Syndication < ActiveRecord::Base
  belongs_to :post
  
  validates :name, presence: true
  validates :url,  presence: true
end
