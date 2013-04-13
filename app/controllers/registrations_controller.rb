class RegistrationsController < ApplicationController
  def index
    @registrations = current_user.registrations.all
  end

  def show
    @registrations = current_user.registrations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def create
    unless user_logged_in?
      redirect_to new_user_path(course_id: params[:course_id])
      return
    end

    if @registration = current_user.registrations.where(course_id: params[:course_id]).first
      notice = "You are already registered on this course"
    else
      @registration = current_user.registrations.create(course_id: params[:course_id]) unless @registration
      notice = "You are now registered on this course"
    end

    redirect_to course_path(@registration.course), notice: notice 
  end

  def certificate
    @registration = current_user.registrations.find(params[:id])
    render :layout => "certificate"
  end
end
