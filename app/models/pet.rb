class Pet < ActiveRecord::Base
  belongs_to :animal
  belongs_to :user
  validates_inclusion_of :gender, :in => ["Male", "Female"]
end
