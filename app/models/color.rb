class Color < ApplicationRecord

  validates :name, :hex_code, presence: true

  has_many :drawings
  has_many :grid_squares, through: :drawings
  has_many :users, through: :drawings

  def most_recent_user
    self.users.last
  end
end
