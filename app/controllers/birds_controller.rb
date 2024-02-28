class BirdsController < ApplicationController

  # before_action :set_bird, only: [:show, :update, :destroy]
  def index
    @birds = Bird.all
  end

  def show
    @bird = Bird.find(params[:id])
    @booking = Booking.new
  end

  def new
    @bird = Bird.new
  end

  def create
    @bird = Bird.new(bird_params)
    if @bird.save
      redirect_to bird_path(@bird)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  #   @bird.update(bird_params)
  #   redirect_to bird_path(@bird)
  # end

  # def destroy
  #   @bird.destroy
  #   redirect_to birds_path, status: :see_other
  # end

private

  def set_bird
    @bird = Bird.find(params[:id])
  end

  def bird_params
    params.require(:bird).permit(:name, :common_family, :geography, :chant_url)
  end
end
