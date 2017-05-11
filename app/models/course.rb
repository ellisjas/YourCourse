class Course < ApplicationRecord
  
  has_one :user
  
  has_many :locatables, dependent: :destroy
  has_many :locations, through: :locatables
  
  has_many :categorisations, dependent: :destroy
  has_many :categories, through: :categorisations
  
  has_many :likeables, foreign_key: "liked_id",
                       dependent:   :destroy
  has_many :likers, through: :likeables, source: :liker
                       
  has_many :dislikeables, foreign_key: "disliked_id",
                       dependent:   :destroy
  has_many :dislikers, through: :dislikeables, source: :disliker
  
  mount_uploader :picture, PictureUploader
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { in: 10..50 },  uniqueness: { case_sensitive: false }
  validates :prerequisite, presence: true, length: { in: 10..50 }
  validates :description, presence: true, length: { in: 30..400 }
  validate :picture_size
  validates :locations, presence: true
  validates :categories, presence: true
  
  def liker?(user)
    likes.include?(user)
  end
  
  def disliker?(user)
    dislikes.include?(user)
  end
  
  private
  
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
  
end
