class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :manager, :boolean, null: false
  end
end
