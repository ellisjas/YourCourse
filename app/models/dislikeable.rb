class Dislikeable < ApplicationRecord
  
  #after_create :remove_like
  
  belongs_to :disliked, class_name: "Course"
  belongs_to :disliker, class_name: "User"
  validates :disliked_id, presence: true
  validates :disliker_id, presence: true
  
  private
  
    # def remove_like
    #   like = Likeable.where('liker_id = ? AND liked_id = ?', self.disliker_id, self.disliked_id)
    #   if !like.nil?
    #     like.destroy
    #   end
    # end
  
end
