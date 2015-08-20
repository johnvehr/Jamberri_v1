class AddUserIdAndHostIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer
    add_column :events, :host_id, :integer

    add_index :events, :user_id
    add_index :events, :host_id
  end
end
