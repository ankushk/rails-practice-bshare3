class RenameUserId < ActiveRecord::Migration
  def change
    rename_column :users, :email, :userid
  end
end
