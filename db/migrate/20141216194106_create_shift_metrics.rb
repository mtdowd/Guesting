class CreateShiftMetrics < ActiveRecord::Migration
  def change
    create_table :shift_metrics do |t|
      t.belongs_to :shift, null: false, index: true
      t.integer :sales
      t.integer :patron_count

      t.timestamps
    end
  end
end
