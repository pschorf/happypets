class CreateAnimals < ActiveRecord::Migration
  def self.up
    create_table :animals do |t|
      t.string :genus
      t.string :species

      t.timestamps
    end
  end

  def self.down
    drop_table :animals
  end
end
