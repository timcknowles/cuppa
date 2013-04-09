class MigrateToLocations < ActiveRecord::Migration
  remove_column :users, :hospital
  remove_column :users, :trust
  add_column :users, :location_id, :integer
end
