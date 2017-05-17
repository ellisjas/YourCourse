class AdminSessionsController < ApplicationController
  
  # Login page
  def new
  end

  # Login
  def create
    admin = Admin.find_by(username: params[:admin_session][:username].downcase)
    if admin && admin.authenticate(params[:admin_session][:password])
      flash[:success] = 'Welcome back!'
      log_in_admin admin
      redirect_to courses
    else
      flash[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

  # Log user out
  def destroy
    log_out_admin
    redirect_to root_url
  end
  
end
