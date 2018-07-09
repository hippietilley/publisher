class Provider < ApplicationRecord
  belongs_to :user

  def self.from_omniauth(auth_hash)
    provider = find_or_initialize_by(uid: auth_hash[:uid])
    provider.attributes = {
      provider: auth_hash[:provider],
      name: auth_hash[:info][:name],
      token: auth_hash[:credentials].try(:[], :token),
      secret: auth_hash[:credentials].try(:[], :secret)
    }
    provider
  end
end
