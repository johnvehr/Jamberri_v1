class AddUserIdToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :user_id, :integer
    add_index :hosts, :user_id
  end
end
