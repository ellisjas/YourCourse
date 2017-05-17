class LikeablesController < ApplicationController
  before_action :logged_in_user
  before_action :set_course
  
  def like
    Likeable.create_like(@course, current_user)
  end
  
  def dislike
    Likeable.create_dislike(@course, current_user)
  end
  
  private
  
    def set_course
      @course = Course.find(params[:id])
    end
  
end
