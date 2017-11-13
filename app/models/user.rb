require 'ffaker'

class User < ApplicationRecord
	validates :name, presence: true

  has_many :drawings
  has_many :grid_squares, through: :drawings
  has_many :colors, through: :drawings

	def self.create_random_user
		user = User.new(name: FFaker::Name.name)
		user.save
		user
	end
end
