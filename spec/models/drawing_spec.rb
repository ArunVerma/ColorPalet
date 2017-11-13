
require "rails_helper"
RSpec.describe Drawing, :type => :model do
  let(:drawing1) {FactoryGirl.create(:drawing)}
  let(:user) { FactoryGirl.create(:user) }
  let(:color) { FactoryGirl.create(:color) }
  let(:grid_square) { FactoryGirl.create(:grid_square) }

  it 'belongs to user' do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  it 'belongs to grid_square' do
    assc = described_class.reflect_on_association(:grid_square)
    expect(assc.macro).to eq :belongs_to
  end

  it 'belongs to color' do
    assc = described_class.reflect_on_association(:color)
    expect(assc.macro).to eq :belongs_to
  end

  it 'without user_id is not valid' do
    drawing = Drawing.new(user_id: '', color_id: 1, grid_square_id: 1)
    expect(drawing).to_not be_valid
  end

  it 'without color_id is not valid' do
    drawing = Drawing.new(user_id: 1, color_id: '', grid_square_id: 1)
    expect(drawing).to_not be_valid
  end

  it 'without grid_square_id is not valid' do
    drawing = Drawing.new(user_id: 1, color_id: 1, grid_square_id: '')
    expect(drawing).to_not be_valid
  end

  it 'with all mandatory fields is valid' do
    drawing = Drawing.new(user_id: user.id, color_id: color.id, grid_square_id: grid_square.id)
    expect(drawing).to be_valid
  end

  it 'for same user, color and grid_square duplicate entry is not valid' do
    drawing2 = Drawing.new(user_id: drawing1.user_id, color_id: drawing1.color_id, grid_square_id: drawing1.grid_square_id)
    expect(drawing2).to_not be_valid
  end

end