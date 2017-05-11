class Likeable < ApplicationRecord
  
  #after_create :remove_dislike
  
  belongs_to :liked, class_name: "Course"
  belongs_to :liker, class_name: "User"
  validates :liked_id, presence: true
  validates :liker_id, presence: true
  
  private
    
    # def remove_dislike
    #   dislike = Dislikeable.where('disliker_id = ? AND disliked_id = ?', self.liker_id, self.liked_id)
    #   if !dislike.nil?
    #   end
    # end
    
end
