class CourseType < ActiveRecord::Base

  attr_accessible :title, :description

  has_many :courses
  has_many :feedback_questions

  validates :title, presence: true
  validates :description, presence: true


  def self.to_csv(courses)
  CSV.generate do |csv|
    csv << column_names
    all.each do |course_type|
      course_type.courses.each do |course|
        csv << course.attributes.values_at(*column_names)
        end
      end
    end  
  end
end
