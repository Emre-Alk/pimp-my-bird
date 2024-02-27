class BirdsController < ApplicationController
  def index
    @birds = Bird.all
  end

  def show
    @bird = Bird.find(params[:id])
    @booking = Booking.new
  end

  def new
  end

  def create
  end
end
