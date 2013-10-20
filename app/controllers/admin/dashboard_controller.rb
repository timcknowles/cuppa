class Admin::DashboardController < AdminController

  def index
    @courses = get_courses
  end

  private

  def get_courses
    if params[:start_time]
      session[:admin_start_time] = Date.new(params[:start_time]["year"].to_i, params[:start_time]["month"].to_i)
    end
    if params[:end_time]
      session[:admin_end_time] = Date.new(params[:end_time]["year"].to_i, params[:end_time]["month"].to_i)
    end
    @start_time = session[:admin_start_time] || Date.new(2012,01,01)
    @end_time = session[:admin_end_time] || Date.today

    @courses = Course.where("start_time >= ?", @start_time).
      where("end_time <= ?", (Date.new(@end_time.year, @end_time.month, 1) + 1.month))
  end
end
