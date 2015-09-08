class AddAttachmentHostAvatarToHosts < ActiveRecord::Migration
  def self.up
    change_table :hosts do |t|
      t.attachment :host_avatar
    end
  end

  def self.down
    remove_attachment :hosts, :host_avatar
  end
end
