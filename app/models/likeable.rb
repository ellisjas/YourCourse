class Likeable < ApplicationRecord
  
  belongs_to :liked, class_name: "Course"
  belongs_to :liker, class_name: "User"
  validates :liked_id, presence: true
  validates :liker_id, presence: true
  
  # Create a like for course
  def self.create_like(course, current_user)
    like = Likeable.find_or_initialize_by(liker_id: current_user.id, liked_id: course.id)
    if like.like
      like.destroy
    else
      like.like= true
      like.save
    end
  end
  
  # Create a dislike for course
  def self.create_dislike(course, current_user)
    like = Likeable.find_or_initialize_by(liker_id: current_user.id, liked_id: course.id)
    if like.like == false
      like.destroy
    else
      like.like = false
      like.save
    end
  end
  
  # def self.reset_likes(course)
  #   likes = Likeable.where(liked_id: course.id)
  #   likes.destroy_all
  # end
    
end
