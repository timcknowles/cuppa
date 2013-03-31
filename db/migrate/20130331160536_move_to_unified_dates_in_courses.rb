class MoveToUnifiedDatesInCourses < ActiveRecord::Migration
  def change
    change_column :courses, :start_time, :datetime
    change_column :courses, :end_time, :datetime
    remove_column :courses, :date
  end
end
