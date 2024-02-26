class Bird < ApplicationRecord
  has_many :bookings

  validates :name, :common_family, presence: true
end
