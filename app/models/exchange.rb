class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :location, length: { minimum: 5 }, presence: true
  validates :time_slot, presence: true
end
