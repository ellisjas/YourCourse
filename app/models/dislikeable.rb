class Dislikeable < ApplicationRecord
  
  belongs_to :disliked, class_name: "Course"
  belongs_to :disliker, class_name: "User"
  validates :disliked_id, presence: true
  validates :disliker_id, presence: true
  
end
