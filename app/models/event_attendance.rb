class EventAttendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :event

  validates :attendee, uniqueness: { scope: :event }
end
