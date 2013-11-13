class RemoveDesignationFromcourses < ActiveRecord::Migration
  def change
    remove_column :courses, :Designation, :string
  end
end
