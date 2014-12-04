class CreateBartenderProfiles < ActiveRecord::Migration
  def change
    create_table :bartender_profiles do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email
      t.string :twitter
      t.string :facebook

      t.timestamps
    end
  end
end
