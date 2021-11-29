class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :location, presence: true
  validates :time_slot, presence: true
end
