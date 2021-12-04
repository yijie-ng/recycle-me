class Item < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :number_available, presence: true
end
