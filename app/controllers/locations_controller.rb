class LocationsController < ApplicationController
  
  before_action :logged_in_user, only: [:new, :create]
  
  def show
    @location = Location.find(params[:id])
  end
  
  def new
    @location = Location.new
  end
  
  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Location created!"
      redirect_to root_url
    end
  end
  
  private
    
    def location_params
      params.require(:location).permit(:location)
    end
  
end
