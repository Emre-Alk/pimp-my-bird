class BirdsController < ApplicationController
  # before_action :set_bird, only: [:show, :update, :destroy]

  def index
    @birds = Bird.all
    @users = User.all

    @markers = @birds.map do |bird|
      {
        lat: bird.user.latitude,
        lng: bird.user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {bird: bird}),
        marker_html: render_to_string(partial: "marker")
      }
    end
    # @markers = @users.geocoded.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude,
    #     info_window_html: render_to_string(partial: "info_window", locals: {user: user}),
    #     marker_html: render_to_string(partial: "marker")
    #   }
    # end
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
    @bird.user_id = current_user.id
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
    params.require(:bird).permit(:name, :common_family, :geography, :chant_url, :price, :picture)
  end
end
