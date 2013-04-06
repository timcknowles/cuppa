class AddNhsTrusts < ActiveRecord::Migration
  def change
    add_column :users, :trust, :string
    add_column :users, :hospital, :string
  end
end
