class FeedbackAnswer < ActiveRecord::Base
  attr_accessible :answer, :feedback_question_id

  belongs_to :feedback_form
  belongs_to :feedback_question


end
