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
    @registration = current_user.registrations.create(course_id: params[:course_id])
    redirect_to course_path(@registration.course)
  end

  def certificate
    @registration = current_user.registrations.find(params[:id])
    render :layout => "certificate"
  end
end

  def destroy
    @registrations = current_user.registrations.find(params[:id])
    @current_user.registrations.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end