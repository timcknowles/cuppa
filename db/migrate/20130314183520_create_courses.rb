class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :course_type_id, null: false

      t.datetime :start_time
      t.datetime :end_time
      t.string :venue
      t.decimal :price

      t.timestamps
    end
  end
end
