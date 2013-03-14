class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :venue
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
