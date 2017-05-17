class Course < ApplicationRecord
  
  has_one :user
  
  has_many :locatables, dependent: :destroy
  has_many :locations, through: :locatables
  
  has_many :categorisations, dependent: :destroy
  has_many :categories, through: :categorisations
  
  has_many :likeables, foreign_key: "liked_id",
                       dependent:   :destroy
  has_many :likers, through: :likeables, source: :liker
  
  mount_uploader :picture, PictureUploader
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { in: 10..50 },  uniqueness: { case_sensitive: false }
  validates :prerequisite, presence: true, length: { in: 10..50 }
  validates :description, presence: true, length: { in: 30..400 }
  validate :picture_size
  
  private
  
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
  
end
