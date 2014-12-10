class CreateBarGigMemberships < ActiveRecord::Migration
  def change
    create_table :bar_gig_memberships do |t|
      t.references :bar, null: false, index: true
      t.references :user, null: false, index: true

      t.timestamps
    end
  end
end
