class AddMailingListBooleanToUserModel < ActiveRecord::Migration
  def change
    add_column :users, :mailing_list, :boolean, default: false, null: false
  end
end
