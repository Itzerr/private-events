class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :event_attendances
  has_many :attendees, through: :event_attendances, source: :attendee

  validates :name, :desc, :date, presence: true

  scope :upcoming, -> { where('date > ?', DateTime.now) }
  scope :past, -> { where('date < ?', DateTime.now) }
end
