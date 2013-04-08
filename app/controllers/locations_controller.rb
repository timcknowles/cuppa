class LocationsController < ApplicationController
  def index
    @location = Location.order(:trust).where("trust like ?", "%#{params[:term]}%")
    render json: @location.map(&:trust)
    end
  def show
    @location = Location.find(params[:id])
    respond_to do |format|
    

      format.html # show.html.erb
      format.json { render json: @location }
  end
end
end