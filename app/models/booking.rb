class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bird

  validates :start_date, :end_date, presence: true
  # todo: validates ==> end_date ultérieur à start_date

end
