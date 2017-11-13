require "rails_helper"
RSpec.describe DrawingsController, :type => :controller do
	describe "GET #index" do
    let(:color1) { FactoryGirl.create(:color) }
    let(:color2) { FactoryGirl.create(:color, name: 'Green', hex_code: '#125489') }

    it "responds successfully" do
      get :index
      expect(response).to be_success
    end

    xit "assigns @colors" do
      get :index
      expect(assigns(:colors)).to eq([color1, color2])
    end

     ## TODO : some of the methods are deprecated now. so its throwing error. Need to find alternate or fix
  end
end