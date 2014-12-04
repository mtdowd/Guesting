class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :twitter
      t.string :facebook
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
