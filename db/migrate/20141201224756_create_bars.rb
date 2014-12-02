class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip
      t.string :phone, null: false
      t.string :website

      t.timestamps
    end

    add_index :bars, [:name, :address, :city, :state]
  end
end
