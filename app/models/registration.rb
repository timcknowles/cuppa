class Registration < ActiveRecord::Base

  attr_accessible :course

  belongs_to :course
  belongs_to :user
  
  validate :course, presence: true
  validate :user, presence: true
  
  before_create do
    self.waiting_list = course.full?
    true
  end
end
