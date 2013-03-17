class AddPlacesAvailableToCourses < ActiveRecord::Migration
  def change
  add_column :courses, :places_available, :integer
  end
end
