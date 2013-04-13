class CreateFeedbackForms < ActiveRecord::Migration
  def change
    create_table :feedback_forms do |t|
      t.integer :registration_id, null: false
      t.datetime :completed_at, null: true

      t.timestamps
    end
  end
end
