class Drawing < ApplicationRecord

  validates :user_id, :color_id, :grid_square_id, presence: true

  belongs_to :user
  belongs_to :color
  belongs_to :grid_square
end
