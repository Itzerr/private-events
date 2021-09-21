class EventInvitation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, uniqueness: { scope: :event, message: 'already invited.' }
end
