class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :event_attendances
  has_many :attendees, through: :event_attendances, source: :attendee

  has_many :event_invitations
  has_many :invited, through: :event_invitations, source: :user

  validates :name, :desc, :date, presence: true

  scope :upcoming, -> { where('date > ?', DateTime.now) }
  scope :past, -> { where('date < ?', DateTime.now) }
end
