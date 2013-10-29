class Admin::DashboardController < AdminController

  before_filter :setup_dates

  def index
    @grouped_courses = courses.group_by(&:course_type)
    total_revenue
  end

  private

  def setup_dates
    if params[:start_time]
      session[:admin_start_time] = Date.new(params[:start_time]["year"].to_i, params[:start_time]["month"].to_i)
    end
    if params[:end_time]
      session[:admin_end_time] = Date.new(params[:end_time]["year"].to_i, params[:end_time]["month"].to_i)
    end
    @start_time = session[:admin_start_time] || Date.new(2012,01,01)
    @end_time = session[:admin_end_time] || Date.today
  end

  def courses
    @courses ||= begin
      sql_end_point = Date.new(@end_time.year, @end_time.month, 1) + 1.month
      Course.where("start_time >= ?", @start_time).
             where("end_time <= ?", sql_end_point).
             includes([
               course_type: [:feedback_questions], 
               registrations: {
                 feedback_form: :answers,
               }])
      end
    end

  def total_revenue
    @total_revenue ||= courses.sum { |course| course.registrations.size * course.price }
  end
end
