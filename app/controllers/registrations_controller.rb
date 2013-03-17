class RegistrationsController < ApplicationController
def create
    registration = Registration.create(params[:registration])
    redirect_to course_path(registration.course)
  end
end
