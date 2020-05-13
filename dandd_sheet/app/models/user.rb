class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true
  has_secure_password
  has_many :characters
end