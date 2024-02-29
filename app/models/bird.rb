class Bird < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :picture

  validates :name, :common_family, presence: true
end
