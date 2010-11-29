class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.text :contents
      t.belongs_to :source
      t.belongs_to :destination
      t.timestamp :time
      t.boolean :read

      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
