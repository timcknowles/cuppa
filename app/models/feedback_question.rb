class FeedbackQuestion < ActiveRecord::Base
  attr_accessible :content, :course_id, :possible_answers, :question_type_id

  belongs_to :course

  belongs_to_enum :question_type, [:free_text, :agreement_level, :drop_down, :radio_buttons]
 
  def possible_answers_array
    self.possible_answers.split("\n")
  end
end
