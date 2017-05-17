class LikeablesController < ApplicationController
  before_action :logged_in_user, only: [:like, :dislike]
  before_action :set_course
  before_action :logged_in_admin, only: :reset
  
  def like
    Likeable.create_like(@course, current_user)
  end
  
  def dislike
    Likeable.create_dislike(@course, current_user)
  end
  
  def reset    
    if @course.likeables.any?
      Likeable.reset_likes(@course)
    end
  end
  
  private
  
    def set_course
      @course = Course.find(params[:id])
    end
  
end
