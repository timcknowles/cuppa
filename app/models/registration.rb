class Registration < ActiveRecord::Base

  attr_accessible :course, :course_id, :paid, :feedback_form_completed, :certificate

  belongs_to :course
  belongs_to :user
  has_one :feedback_form
  has_many :feedback_answers, through: :feedback_form, source: :answers

  validate :course, presence: true
  validate :user, presence: true

  validates :user_id, uniqueness: {scope: :course_id}

  after_create do
    UserMailer.delay.registration_confirmation(self)
    UserMailer.delay(run_at: course.start_time.getutc.in_time_zone("London") - 1.week).reminder(self)
    UserMailer.delay(run_at: course.end_time.getutc.in_time_zone("London")).feedback(self)
    true
  end

  def toggle_paid!
    self.paid = !self.paid
    save!
  end

  def on_waiting_list?
    !course.registrations.
      limit(course.places_available).
      order('registrations.created_at ASC').
      pluck('registrations.id').
      include?(id)
  end
end
