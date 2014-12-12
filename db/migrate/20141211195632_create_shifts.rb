class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.belongs_to :bar, null: false, index: true
      t.date :shift_date, null: false, index: true
      t.time :shift_start, null: false
      t.text :details

      t.timestamps
    end
  end
end
