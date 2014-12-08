class AddUserToBar < ActiveRecord::Migration
  def change
    add_reference :bars, :user, index: true
  end
end
