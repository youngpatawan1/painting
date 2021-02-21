class User < ApplicationRecord
    before_save {self.email = email.downcase }
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :username, presence: true, length: { maximum: 40 }, uniqueness: true
    validates :email, presence: true, length: { maximum: 200 }, format: { with: EMAIL_REGEX }, uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 7 }
end
