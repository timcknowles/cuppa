class AddCourseTypes < ActiveRecord::Migration
  def up
    create_table :course_types do |t|
      t.string :title
      t.text :description
    end
  end
end
