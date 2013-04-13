class AdminController < ApplicationController

  before_filter :check_admin

  protected

    def check_admin
      return true if user_logged_in? && current_user.admin?

      redirect_to courses_path
      false
    end

end
