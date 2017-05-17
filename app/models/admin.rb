class Admin < ApplicationRecord
  before_save { username.downcase! }
  validates :username, presence: true, length: { maximum: 25 }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
