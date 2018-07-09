class User < ApplicationRecord
  has_secure_password
  validates :password, presence: :true, on: :create
  validates :email,    presence: :true, uniqueness: true, on: [:create, :update]

  has_many :links
  has_many :post_types
  has_many :providers
  has_many :redirects
end
