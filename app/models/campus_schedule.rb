class CampusSchedule < ApplicationRecord
  enum shift: {morning: 1, afternoon: 2, nightly: 3}
  belongs_to :campus
  validates :start, :end, :shift, presence: true
  validates_uniqueness_of :campus_id, scope: [:start, :end]
end
