class CreatePets < ActiveRecord::Migration
  def self.up
    create_table :pets do |t|
      t.string :name, :null => false
      t.string :gender
      t.integer :age
      t.references :animal, :null => false
      t.references :user ,  :null => false
      t.timestamps
    end
    execute <<-SQL
      ALTER TABLE pets ADD CONSTRAINT fk_pets_users
        FOREIGN KEY (user_id)
        REFERENCES  users(id) ON DELETE RESTRICT
    SQL
    execute <<-SQL
      ALTER TABLE pets ADD CONSTRAINT fk_pets_animals
        FOREIGN KEY (animal_id)
        REFERENCES  animals(id) ON DELETE RESTRICT
    SQL
  end

  def self.down
    drop_table :pets
  end
end
