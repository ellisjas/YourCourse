class CoursesController < ApplicationController
  
  before_action :set_course, only: [:edit, :update]
  before_action :logged_in_user, only: [:new, :create, :edit, :update]
  before_action :course_coordinator, only: [:edit, :update]
  
  # Course page
  def show
    @course = Course.find(params[:id])
    @user = User.find(@course.user_id)
    @categories = @course.categories
    @locations = @course.locations                  
  end
  
  # All courses page
  def index
    @courses = Course.all
    @users = User.find_by_sql("SELECT u.id, u.email, u.name FROM users AS u JOIN courses ON u.id = courses.user_id GROUP BY u.id")
  end
  
  # Create a course page
  def new
    @course = current_user.courses.build
  end
  
  # Create a course action
  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      flash[:success] = "Course created!"
      redirect_to courses_url
    else
      render 'new'
    end
  end
  
  # Edit course page
  def edit
  end
  
  # Edit course action
  def update
    if @course.update_attributes(course_params)
      flash[:success] = "Course updated"
      redirect_to @course
    else
      render 'edit'
    end
  end
  
  private
    
    def course_params
      params.require(:course).permit(:name, :prerequisite, :description, :user_id, :picture, :category_ids => [], :location_ids => [])
    end
    
    # Sets course by getting id from params
    def set_course
      @course = Course.find(params[:id])
    end
    
    # Checks that current_user is course coordinator
    def course_coordinator
      @course = Course.find(params[:id])
      user = User.find(@course.user_id)
      if !current_user?(user)
        flash[:danger] = "Access denied"
        redirect_to courses_url
      end
    end
  
end