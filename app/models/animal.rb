class Animal < ActiveRecord::Base
  validates_presence_of :genus, :species
  has_many :pets
  
  def to_s
    "#{genus} #{species}"
  end
end
