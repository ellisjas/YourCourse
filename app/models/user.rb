class User < ApplicationRecord
  before_save { email.downcase! }
  
  # User has many courses
  has_many :courses, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 50, minimum: 4 }
  VALID_EMAIL_REGEX = /\A[A-z]+\.+[A-z]+@rmit.edu.au\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX, 
                                                                        message: "must be in the format <first-name>.<last.name>@rmit.edu.au" }, 
                                                                        uniqueness: { case_sensitive: false }
  
  has_secure_password
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[\W]).{8,}\z/
  validates :password, presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX, 
                                                                          message: "must contain at least one capital letter, number, and special character." }

  has_secure_password
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
