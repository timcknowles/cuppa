class AddDesignationToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :Designation, :string
  end
end
