
require "rails_helper"
RSpec.describe GridSquare, :type => :model do

  it 'has one drawing' do
    assc = described_class.reflect_on_association(:drawing)
    expect(assc.macro).to eq :has_one
  end

  it 'has one color' do
    assc = described_class.reflect_on_association(:color)
    expect(assc.macro).to eq :has_one
  end

  it 'has one user' do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :has_one
  end

  it 'without cell_id is not valid' do
    cell = GridSquare.new(cell_id: '')
    expect(cell).to_not be_valid
  end

  it 'with cell_id is valid' do
    cell = GridSquare.new(cell_id: '12')
    expect(cell).to be_valid
  end

end