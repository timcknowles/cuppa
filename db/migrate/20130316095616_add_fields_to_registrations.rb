class AddFieldsToRegistrations < ActiveRecord::Migration
  def change
    
    add_column :registrations, :feedback_form_completed, :boolean, default: false
    add_column :registrations, :certificate_sent, :boolean, default: false
    add_column :registrations, :paid, :boolean, default: false
    add_column :registrations, :waiting_list, :boolean, default: false


  end
end
