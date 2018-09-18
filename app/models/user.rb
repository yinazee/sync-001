class User < ApplicationRecord
  has_many :events
  has_secure_password

  validates :name, presence: true, length: { maximum: 30 }
  validates :password, presence: true, length: { minimum: 5 }

  #find or create by oauth user_id
  def self.set_user_from_omniauth(uid)
    #user logged in via OAuth
    first_or_create(uid: uid) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      #setting a random secure password if a new user
      u.password ||= SecureRandom.base58
    end
  end



end
