
require "rails_helper"
RSpec.describe Color, :type => :model do

  it 'has many drawings' do
    assc = described_class.reflect_on_association(:drawings)
    expect(assc.macro).to eq :has_many
  end

  it 'has many grid_squares' do
    assc = described_class.reflect_on_association(:grid_squares)
    expect(assc.macro).to eq :has_many
  end

  it 'has many users' do
    assc = described_class.reflect_on_association(:users)
    expect(assc.macro).to eq :has_many
  end

  it 'without name is not valid' do
    color = Color.new(name: '', hex_code: '#12369')
    expect(color).to_not be_valid
  end

  it 'without hex_code is not valid' do
    color = Color.new(name: 'Green', hex_code: '')
    expect(color).to_not be_valid
  end

  it 'with name and hex_code is valid' do
    color = Color.new(name: 'Green', hex_code: '#12369')
    expect(color).to be_valid
  end

  describe 'most_recent_user' do
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }
    let(:color) { FactoryGirl.create(:color) }
    let(:grid_square) { FactoryGirl.create(:grid_square) }
    let(:drawing) {FactoryGirl.create(:drawing, user: user1, color: color, grid_square: grid_square)}
    let(:drawing) {FactoryGirl.create(:drawing, user: user2, color: color, grid_square: grid_square)}
    it 'fetches most recent user' do
      user = drawing.color.most_recent_user
      expect(user.name).to eq user2.name
    end
  end
  
end