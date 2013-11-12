class CourseType < ActiveRecord::Base

  attr_accessible :title, :description

  has_many :courses
  has_many :feedback_questions

  validates :title, presence: true
  validates :description, presence: true

  def to_csv(options ={})
    CSV.generate(options) do |csv|
      csv << csv_titles
      courses.each do |course|
        csv << course.csv_data
      end
    end
  end

  def csv_titles
    titles = [
      :id,
      :course_type_title,
      :start_time,
      :end_time,
      :registrations_count,
      :total_revenue
    ]
    feedback_questions.each do |question|
      titles << question.content
    end
    titles
  end

 end
