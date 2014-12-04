class CreateManagerProfiles < ActiveRecord::Migration
  def change
    create_table :manager_profiles do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email

      t.timestamps
    end
  end
end
