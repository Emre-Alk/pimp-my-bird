class Bird < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, :common_family, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
