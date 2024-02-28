class Bird < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, :common_family, presence: true
end
