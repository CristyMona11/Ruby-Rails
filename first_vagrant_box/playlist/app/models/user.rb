class User < ActiveRecord::Base
  has_secure_password
  has_many :songs
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name,:email,:password,  presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
