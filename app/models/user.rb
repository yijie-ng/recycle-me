class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exchanges
  has_many :items

  validates :name, length: { minimum: 5, maximum: 50 }, presence: true
  validates :phone_number, length: { minimum: 8, maximum: 14 }, presence: true
end
