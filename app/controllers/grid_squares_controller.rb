class GridSquaresController < ApplicationController
  def show
    drawing = Drawing.where(params[:grid_square_id]).last
    data = {user: drawing.user.name, color_name: drawing.color.name, color_code: drawing.color.hex_code, color_date: drawing.created_at.strftime("%b %d, %Y")}
    render json: data
  end
end
