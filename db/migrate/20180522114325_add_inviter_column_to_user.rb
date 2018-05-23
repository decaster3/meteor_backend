class AddInviterColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :inviter, index: true
  end
end
