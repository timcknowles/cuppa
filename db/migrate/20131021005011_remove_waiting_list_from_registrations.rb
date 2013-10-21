class RemoveWaitingListFromRegistrations < ActiveRecord::Migration
  def up
    remove_column :registrations, :waiting_list
  end
end
