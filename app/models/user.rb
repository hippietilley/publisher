class User < ApplicationRecord
  has_secure_password
  validates :password, presence: :true, on: :create
  validates :email,    presence: :true, uniqueness: true, on: [:create, :update]

  has_many :links,      dependent: :destory
  has_many :post_types, dependent: :destory
  has_many :providers,  dependent: :destory
  has_many :redirects,  dependent: :destory
end
