class EventGuest < ApplicationRecord
  belongs_to :event
  belongs_to :guest

end
