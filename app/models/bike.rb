class Bike < ApplicationRecord
  validates :model, presence: true
  belongs_to :user
  has_many :bookings
end
