class LocationsController < ApplicationController
   def index
    @locations = Location.all
  end
  def show
    @locations = Location.find(params[:id])
    respond_to do |format|
    

      format.html # show.html.erb
      format.json { render json: @location }
  end
end
end