class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_title
      t.datetime :starts_at
      t.string :time_zone

      t.timestamps null: false
    end
  end
end
