class Registration < ActiveRecord::Base

  attr_accessible :course, :course_id, :feedback_form_completed
  attr_accessible :feedback_form_completed, :as => :admin

  belongs_to :course
  belongs_to :user
  
  validate :course, presence: true
  validate :user, presence: true
  
  before_create do
    self.waiting_list = course.full?
    true
  end


  
end 