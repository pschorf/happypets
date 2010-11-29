class Notification < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      ALTER TABLE notifications ADD CONSTRAINT fk_notifications_source
      FOREIGN KEY(source_id)
      REFERENCES pets(id)
    SQL
    
    execute <<-SQL
      ALTER TABLE notifications ADD CONSTRAINT fk_notifications_dest
      FOREIGN KEY(destination_id)
      REFERENCES pets(id)
    SQL
  end

  def self.down
    execute <<-SQL
      ALTER TABLE notifications DROP FOREIGN KEY fk_notifications_source
    SQL
    
    execute <<-SQL
      ALTER TABLE notifications DROP FOREIGN KEY fk_notifications_dest
    SQL
  end
end
