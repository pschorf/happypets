class Animal < ActiveRecord::Base
  validates_presence_of :genus, :species
end
