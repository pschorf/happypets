class Notification < ActiveRecord::Base
  belongs_to :source, :class => 'Pet'
  belongs_to :destination, :class => 'Pet'
end
