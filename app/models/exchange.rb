class Exchange < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :location, presence: true
  validates :time_slot, presence: true
end
