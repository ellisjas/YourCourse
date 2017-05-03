class Location < ApplicationRecord
  
  has_many :courses
  
  validates :location, presence: true, length: {maximum: 20}, uniqueness: { case_sensitive: false }
  
end
