class LikeablesController < ApplicationController
  before_action :logged_in_user
  
  def create
    like = current_user.likeables.where(liked_id: params[:liked_id]).first_or_initialize
    if like.new_record? && like.save
      redirect_to courses_url
    else
      redirect_to courses_url, flash: { danger: "You can only vote on a course once!" }
    end
  end

  def destroy
    like = Likeable.find(params[:id])
    like.destroy
    redirect_to courses_url
  end
  
end
