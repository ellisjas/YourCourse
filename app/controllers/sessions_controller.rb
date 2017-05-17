class SessionsController < ApplicationController

  # Login page
  def new
  end

  # Login
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

  # Log user out
  def destroy
    log_out
    redirect_to root_url
  end
end