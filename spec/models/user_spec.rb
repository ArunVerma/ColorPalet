
require "rails_helper"
RSpec.describe User, :type => :model do

  it 'has many drawings' do
    assc = described_class.reflect_on_association(:drawings)
    expect(assc.macro).to eq :has_many
  end

  it 'has many grid_squares' do
    assc = described_class.reflect_on_association(:grid_squares)
    expect(assc.macro).to eq :has_many
  end

  it 'has many colors' do
    assc = described_class.reflect_on_association(:colors)
    expect(assc.macro).to eq :has_many
  end  

  it 'without name is not valid' do
    user = User.new(name: '')
    expect(user).to_not be_valid
  end

  it 'with name is valid' do
    user = User.new(name: 'Test User')
    expect(user).to be_valid
  end

  describe '.create_random_user' do
    it 'create an user' do
      user = User.create_random_user
      expect(user).to be_valid
    end
  end
  
end