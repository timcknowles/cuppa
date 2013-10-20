class LocationsController < ApplicationController
  skip_before_filter :check_logged_in
  def index
    @location = Location.order(:trust).where("LOWER(trust) like LOWER(?)", "%#{params[:term]}%")
    render json: @location.map(&:trust)
  end
end
