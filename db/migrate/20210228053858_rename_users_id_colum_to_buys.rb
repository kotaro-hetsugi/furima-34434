class RenameUsersIdColumToBuys < ActiveRecord::Migration[6.0]
  def change
    rename_column :buys, :users_id, :user_id
  end
end
