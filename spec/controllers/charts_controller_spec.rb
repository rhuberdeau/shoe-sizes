require 'spec_helper'

describe ChartsController do
  describe "GET frequency" do
    before { 10.times { FactoryGirl.create(:shoe) } }
    it "assigns @shoes" do
      shoes = Shoe.frequency_of_size
      get :frequency
      expect(assigns(:shoes)).to eq(shoes)
    end
  end
end