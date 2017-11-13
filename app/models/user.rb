class User < ApplicationRecord

	validates :name, presence: true

  has_many :drawings
  has_many :grid_squares, through: :drawings
  has_many :colors, through: :drawings
end
