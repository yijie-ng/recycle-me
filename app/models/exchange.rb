class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :item
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :location, length: { minimum: 5 }, presence: true
  validates :time_slot, presence: true
end
