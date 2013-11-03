class CourseType < ActiveRecord::Base

  attr_accessible :title, :description

  has_many :courses
  has_many :feedback_questions

  validates :title, presence: true
  validates :description, presence: true


 end