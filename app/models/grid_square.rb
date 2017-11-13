class GridSquare < ApplicationRecord

  validates :cell_id, presence: true

  has_many :drawings
  has_many :users, through: :drawings
  has_many :colors, through: :drawings

  def latest_color
    self.colors.last
  end
end
