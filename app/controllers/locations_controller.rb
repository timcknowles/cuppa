class LocationsController < ApplicationController
  def index
    @location = Location.order(:trust).where("LOWER(trust) like LOWER(?)", "%#{params[:term]}%")
    render json: @location.map(&:trust)
  end
end
