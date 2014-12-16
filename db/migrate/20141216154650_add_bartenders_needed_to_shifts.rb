class AddBartendersNeededToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :bartender_count, :integer, default: 1
  end
end
