class Bird < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :picture

  validates :name, :common_family, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
