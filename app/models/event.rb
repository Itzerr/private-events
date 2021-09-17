class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'

  validates :name, :desc, :date, presence: true
end
