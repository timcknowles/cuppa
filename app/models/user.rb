class User < ActiveRecord::Base
  has_many :registrations
  has_many :courses, through: :registrations
  accepts_nested_attributes_for :courses


  attr_accessor :initial_course_id
 
  after_create do
  self.registrations.create(course_id: initial_course_id) if initial_course_id

end

end


  