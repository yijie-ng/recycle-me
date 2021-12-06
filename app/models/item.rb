class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :title, length: { minimum: 5 }, presence: true
  validates :description, presence: true
  validates :condition, inclusion: { in: %w[Excellent Good Average Bad Broken] }, presence: true
  validates :number_available, presence: true
end
