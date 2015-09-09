class AddAttachmentEventAvatarToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :event_avatar
    end
  end

  def self.down
    remove_attachment :events, :event_avatar
  end
end
