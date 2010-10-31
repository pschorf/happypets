class RenameInterestType < ActiveRecord::Migration
  def self.up
    change_table :interests do |t|
      t.rename :type, :property
    end
  end

  def self.down
    change_table :interests do |t|
      t.rename :property, :type
    end
  end
end
