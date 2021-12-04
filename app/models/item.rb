class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
  validates :condition, presence: true
end
