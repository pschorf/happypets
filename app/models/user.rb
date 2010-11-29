class User < ActiveRecord::Base
  acts_as_authentic
  has_many :pets, :dependent => :destroy
  has_many :interests, :dependent => :destroy
  def to_s
    "#{name} (#{username})"
  end
  
  def unread_notifications
    return (self.pets.map {|p| p.received_notifications.where(:read => false)}).flatten
  end
end
