class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :title, length: { minimum: 5 }, presence: true
  validates :description, presence: true
  validates :condition, inclusion: { in: %w[Excellent Good Average Bad Broken] }, presence: true
  validates :number_available, numericality: { greater_than_or_equal_to: 1 }, presence: true
  validates :year_made, numericality: { greater_than_or_equal_to: 1990 }
end
