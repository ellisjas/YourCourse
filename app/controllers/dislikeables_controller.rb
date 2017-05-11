class DislikeablesController < ApplicationController
  before_action :logged_in_user
  
  def create
    dislike = current_user.dislikeables.where(disliked_id: params[:disliked_id]).first_or_initialize
    if dislike.new_record? && dislike.save
      redirect_to courses_url
    else
      redirect_to courses_url, flash: { danger: "You can only vote on a course once!" }
    end
  end

  def destroy
  end
  
end
