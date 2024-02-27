class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    @bird = Bird.find(params[:bird_id])
  end

  def create
    @current_user_id = current_user.id
    @booking = Booking.new(bookingSet_params)
    @bird = Bird.find(:bird_id)
    @booking.bird = @bird
    @booking.user = @current_user_id

    if @booking.save
      redirect_to user_bookings_path(@current_user_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  private

  def bookingSet_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
