class CreateFeedbackAnswers < ActiveRecord::Migration
  def change
    create_table :feedback_answers do |t|
      t.integer :feedback_form_id, null: false
      t.integer :feedback_question_id, null: false
      t.text :answer, null: false

      t.timestamps
    end
  end
end
