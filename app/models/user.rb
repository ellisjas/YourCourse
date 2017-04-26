class User < ApplicationRecord
  before_save { email.downcase! }
  
  validates :name, presence: true, length: { maximum: 50, minimum: 4 }
  VALID_EMAIL_REGEX = /\A[A-z]+\.+[A-z]+@rmit.edu.au\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  has_secure_password
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[\W]).{8,}\z/
  validates :password, presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX }
  

end
