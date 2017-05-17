class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_filter :get_message
  
  def get_message
    @message = Message.new
  end
  
  #Confirms a logged in user
  def logged_in_user
    unless logged_in?
      flash[:danger] = "You do not have permission to access that page."
      redirect_to login_url
    end
  end
  
  # Checks that user is an admin
  def logged_in_admin
    unless admin_logged_in?
      flash[:danger] = "You do not have permission to do that."
      redirect_to courses_url
    end
  end
  
end
