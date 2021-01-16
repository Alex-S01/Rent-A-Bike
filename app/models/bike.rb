class Bike < ApplicationRecord
  validates :model, presence: true
  belongs_to :user
  has_many :bookings

  has_one_attached :photo
end
