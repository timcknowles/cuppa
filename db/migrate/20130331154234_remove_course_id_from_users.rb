class RemoveCourseIdFromUsers < ActiveRecord::Migration
  def change
     remove_column :users, :course_id
  end
end
