class DrawingsController < ApplicationController
  def index
    @colors = Color.all
    @grid_squares = GridSquare.includes(:color).all
    @user = User.create_random_user
  end

  def create
    response = nil
    if drawing_params[:color_id].present?
      drawing = Drawing.where(grid_square_id: drawing_params[:grid_square_id]).first
      if drawing.present?
        response = drawing.update_attributes(drawing_params)
      else
        response = Drawing.new(drawing_params).save!
      end
    else
      response = Drawing.where(grid_square_id: drawing_params[:grid_square_id]).first.destroy
    end
    if response
      render json: {status: 200}
    else
      render json: {status: 500}
    end
  end

  def cell_info
    drawing = Drawing.where(grid_square_id: params[:grid_square_id]).first
    data = {user: drawing.user.name, color_name: drawing.color.name, color_code: drawing.color.hex_code, color_date: drawing.created_at.strftime("%b %d, %Y at %H:%M:%S")}
    render json: data
  end

  private
  def drawing_params
    params.require(:drawing).permit(:user_id, :grid_square_id, :color_id)
  end
end
