class BirdsController < ApplicationController
  def index
    @birds = Bird.all
  end

  def show
  end

  def new
  end

  def create
  end
end
