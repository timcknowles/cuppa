class Registration < ActiveRecord::Base

  attr_accessible :course, :course_id, :paid, :feedback_form_completed

  belongs_to :course
  belongs_to :user
  has_one :feedback_form
  
  validate :course, presence: true
  validate :user, presence: true

  validates :user_id, uniqueness: {scope: :course_id}
  
  before_create do
    self.waiting_list = course.full?
    true
  end

  after_create do
    UserMailer.delay(run_at: course.start_time.getutc - 10.minutes).registration_confirmation(user)
    true
    
  end

  def toggle_paid!
    self.paid = !self.paid
    save!
  end
end 
