class Interest < ActiveRecord::Base
  def self.valid_types
    return ['like', 'dislike', 'hobby']
  end
  attr_accessible :property, :thing
  belongs_to :user
  belongs_to :pet
  validates_inclusion_of :property, :in => self.valid_types
  validates_presence_of :property, :thing
  def to_s
    return "#{thing} "
  end

end
