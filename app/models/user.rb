class User < ActiveRecord::Base
  acts_as_authentic
  has_many :pets, :dependent => :destroy
  has_many :interests, :dependent => :destroy
  def to_s
    "#{name} (#{username})"
  end
end
