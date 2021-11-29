class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exhanges
  has_many :items, through: :exchanges

  validates :fullname, length: {maximum: 50}, presence: true
end
