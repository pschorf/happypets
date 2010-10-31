class CreateInterests < ActiveRecord::Migration
  def self.up
    create_table :interests do |t|
      t.string :type
      t.string :thing
      t.references :user
      t.references :pet

      t.timestamps
    end
    execute <<-SQL
      ALTER TABLE interests ADD CONSTRAINT fk_interests_users
      FOREIGN KEY(user_id)
      REFERENCES users(id)
    SQL
    
    execute <<-SQL
      ALTER TABLE interests ADD CONSTRAINT fk_interests_pets
      FOREIGN KEY(pet_id)
      REFERENCES pets(id)
    SQL
  end

  def self.down
    drop_table :interests
  end
end
