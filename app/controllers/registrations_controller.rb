class RegistrationsController < ApplicationController
  def create
    unless user_logged_in?
      redirect_to new_user_path(course_id: params[:course_id])
      return
    end
    @registration = current_user.registrations.create(course_id: params[:course_id])
    redirect_to course_path(@registration.course)
  end

  def certificate
    @registration = current_user.registrations.find(params[:id])
    render :layout => "certificate"
  end
  end
