class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :host_title
      t.text :host_bio

      t.timestamps null: false
    end
  end
end
