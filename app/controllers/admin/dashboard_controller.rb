class Admin::DashboardController < AdminController

  def index
    @courses = get_courses
  end

  private

  def get_courses
    @start_time = session[:admin_start_time] || Date.new(2012,01,01)
    @end_time = session[:admin_end_time] || Date.today
    @courses = Course.where("start_time >= ? and end_time <= ?", @start_date, @end_date)
  end

end
