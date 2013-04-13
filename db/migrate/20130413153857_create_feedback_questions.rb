class CreateFeedbackQuestions < ActiveRecord::Migration
  def change
    create_table :feedback_questions do |t|
      t.integer :course_id, null: false
      t.text :content, null: false
      t.integer :question_type_id, null: false
      t.text :possible_answers, null: true

      t.timestamps
    end
  end
end
