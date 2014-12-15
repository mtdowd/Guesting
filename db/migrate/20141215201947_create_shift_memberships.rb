class CreateShiftMemberships < ActiveRecord::Migration
  def change
    create_table :shift_memberships do |t|
      t.references :shift, null: false, index: true
      t.references :user, null: false, index: true

      t.timestamps
    end
  end
end
