class Course < ApplicationRecord
  
  has_one :user
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { in: 10..50 }
  validates :prerequisite, presence: true, length: { in: 10..50 }
  validates :description, presence: true, length: { in: 30..400 }
  
end
