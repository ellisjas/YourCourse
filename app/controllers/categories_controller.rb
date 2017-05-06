class CategoriesController < ApplicationController
  
  before_action :logged_in_user, only: [:new, :create]
  
  def show
    @category = Category.find(params[:id])
    @courses = @category.courses
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private
    
    def category_params
      params.require(:category).permit(:name)
    end
end
