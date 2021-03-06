class User < ApplicationRecord
    validates :username, :password, :email, :name, presence: true

    validates :username, :email, uniqueness: true 
    validates :name, format: { without: /[0-9]/, message: "Only Letters" }

    has_secure_password

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.name
          user.email = auth.info.email
          user.name = auth.info.name 
          user.password = SecureRandom.hex
        end
    end
end
