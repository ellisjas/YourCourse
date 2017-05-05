class Location < ApplicationRecord
  
  has_many :locatables, foreign_key: "location_id", dependent: :destroy
  has_many :courses, through: :locatables
  
  validates :location, presence: true, length: {maximum: 20}, uniqueness: { case_sensitive: false }
  
  # Checks if location has a course
  def has_course?(course)
    self.courses.include?(course)
  end
  
end
