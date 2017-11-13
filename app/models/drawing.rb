class Drawing < ApplicationRecord

  validates :user_id, :color_id, :grid_square_id, presence: true
  validates :user_id, uniqueness: { scope: [:color_id, :grid_square_id],
    message: "should be unique per user" }

  belongs_to :user
  belongs_to :color
  belongs_to :grid_square
end
