class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.string :venue
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
