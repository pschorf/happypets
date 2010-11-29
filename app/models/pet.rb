class Pet < ActiveRecord::Base
  belongs_to :animal
  belongs_to :user
  has_many :interests, :dependent => :destroy
  has_many :notifications, :dependent => :destroy
  validates_inclusion_of :gender, :in => ["Male", "Female"]
  def likes
    return ((self.interests.select {|i| i.property == 'like'}).map {|i| i.to_s }).join ' '
  end
  def likes=(s)
    self.save
    self.interests.where("property='like'").map {|o| self.interests.delete o} 
    s.split(' ').map {|w| self.interests.create(:property => 'like', :thing => w)}
  end
  def dislikes
    return ((self.interests.select {|i| i.property == 'dislike'}).map {|i| i.to_s }).join ' '
  end
  def dislikes=(s)
    self.save
    self.interests.where("property='dislike'").map {|o| self.interests.delete o} 
    s.split(' ').map {|w| self.interests.create(:property => 'dislike', :thing => w)}
  end
  def hobbies
    return ((self.interests.select {|i| i.property == 'hobby'}).map {|i| i.to_s }).join ' '
  end
  def hobbies=(s)
    self.save
    self.interests.where("property='hobby'").map {|o| self.interests.delete o} 
    s.split(' ').map {|w| self.interests.create(:property => 'hobby', :thing => w)}
  end
end
