class Item < ApplicationRecord
  belongs_to :user
  belongs_to :exchange

  validates :title, presence: true
  validates :description, presence: true
  validates :condition, presence: true
end
