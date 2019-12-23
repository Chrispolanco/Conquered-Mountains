class User < ApplicationRecord
    validates :username, :password_digest, :email, :name, presence: true
    validates :password_digest, length: {in: 8..20}
    validates :username, :email, uniqueness: true 
    validates :name, format: { without: /[0-9]/, message: "Only Letters" }
end