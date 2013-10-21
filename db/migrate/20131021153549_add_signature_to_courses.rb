class AddSignatureToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :signature, :string
  end
end
