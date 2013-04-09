class CreateHomeTrusts < ActiveRecord::Migration
  def change
    create_table :home_trusts do |t|
      t.string :trust
      t.string :hospital

      t.timestamps
    end
  end
end
