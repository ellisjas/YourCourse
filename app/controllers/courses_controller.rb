class CoursesController < ApplicationController
  
  before_action :logged_in_user, only: [:new, :create, :edit, :update]
  
  def show
    @course = Course.find(params[:id])
    @user = User.find(@course.user_id)
    @categories = @course.categories
    @locations = @course.locations                  
  end
  
  def index
    @courses = Course.all
    @users = User.all
  end
  
  def new
    @course = current_user.courses.build
  end
  
  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      flash[:success] = "Course created!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  private
    
    def course_params
      params.require(:course).permit(:name, :prerequisite, :description, :user_id, :picture, :category_ids => [], :location_ids => [])
    end
  
end