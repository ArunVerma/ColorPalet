class GridSquare < ApplicationRecord

  validates :cell_id, presence: true

  has_one :drawing
  has_one :user, through: :drawing
  has_one :color, through: :drawing

end
