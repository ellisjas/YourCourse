class SessionsController < ApplicationController
  
  before_action :is_not_coordinator, only: [:admin_new, :admin_create]
  before_action :is_not_admin, only: [:new, :create]
  before_action :is_admin, only: :admin_destroy

  # Coordinator login page
  def new
  end

  # Coordinator login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Welcome back!'
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # Coordinator log out
  def destroy
    log_out
    redirect_to root_url
  end
  
  # ADMIN
  # Admin login page
  def admin_new
  end

  # Admin login
  def admin_create
    admin = Admin.find_by(username: params[:session][:username].downcase)
    if admin && admin.authenticate(params[:session][:password])
      flash[:success] = 'Welcome back!'
      log_in_admin admin
      redirect_to courses_url
    else
      flash[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

  # Admin log out
  def admin_destroy
    log_out_admin
    redirect_to root_url
  end
  
  private
  
    # Checks that is user not logged in as admin
    def is_not_admin
      if admin_logged_in?
        redirect_to courses_url
      end
    end
    
    # Checks that user is an admin
    def is_admin
      unless admin_logged_in?
        redirect_to courses_url
      end
    end
    
    # Checks that user is not a coordinator
    def is_not_coordinator
      if logged_in?
        redirect_to courses_url
      end
    end
  
end