class DrawingsController < ApplicationController
  def index
    @colors = Color.all
    @grid_squares = GridSquare.includes(:colors).all
    @user = User.create_random_user
  end
end