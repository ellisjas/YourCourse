class StaticPagesController < ApplicationController
  before_action :redirect_logged_in_user
  
  def home
  end
  
  private
  
    def redirect_logged_in_user
      if logged_in?
        redirect_to courses_url
      end
    end
end
