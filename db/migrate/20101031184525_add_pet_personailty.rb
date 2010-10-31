class AddPetPersonailty < ActiveRecord::Migration
  def self.up
    change_table :pets do |t|
      t.string :personality
    end
  end

  def self.down
    change_table :pets do |t|
      remove :personality
    end
  end
end
