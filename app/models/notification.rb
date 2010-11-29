class Notification < ActiveRecord::Base
  belongs_to :source, :class_name => 'Pet'
  belongs_to :destination, :class_name => 'Pet'
end
