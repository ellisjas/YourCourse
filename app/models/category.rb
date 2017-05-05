class Category < ApplicationRecord
  
  has_many :categorisations, dependent: :destroy
  has_many :courses, through: :categorisations
  
  validates :name, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false }
  
  # Checks if category has a course
  def has_course?(course)
    self.courses.include?(course)
  end
  
end
