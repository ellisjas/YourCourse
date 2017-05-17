class StaticPagesController < ApplicationController
  before_action :redirect_logged_in
  
  def home
  end
  
  private
  
    def redirect_logged_in
      if logged_in? || admin_logged_in?
        redirect_to courses_url
      end
    end
end
