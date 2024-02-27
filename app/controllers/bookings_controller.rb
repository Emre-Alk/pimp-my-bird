class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    @bird = Bird.find(params[:bird_id])
  end

  def create
    @current_user = current_user
    @booking = Booking.new(bookingSet_params)
    @bird = Bird.find(params[:bird_id])
    @booking.bird = @bird
    @booking.user = @current_user
    if @booking.save
      redirect_to  user_bookings_path(@current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.all
  end

  private

  def bookingSet_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
