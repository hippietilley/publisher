class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, on: :create
  validates :email,    presence: true, uniqueness: true, on: [:create, :update]

  has_many :links,      dependent: :destroy
  has_many :post_types, dependent: :destroy
  has_many :providers,  dependent: :destroy
  has_many :redirects,  dependent: :destroy
end
