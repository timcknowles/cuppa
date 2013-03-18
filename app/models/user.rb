class User < ActiveRecord::Base
  has_many :registrations
  has_many :courses, through: :registrations
  accepts_nested_attributes_for :courses

  has_secure_password
  validates_presence_of :password, :on => :create

  attr_accessor :initial_course_id
 
  after_create do
  self.registrations.create(course_id: initial_course_id) if initial_course_id
end
end