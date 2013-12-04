require 'spec_helper'

describe Shoe do
  before do
    @shoe = build(:shoe)
  end
  
  subject { @shoe }
  
  it { should respond_to :size }
  
  describe "with valid attributes" do
    it { should be_valid }
  end
  
  describe "when the size is not a number" do
    before { @shoe.size = "aaaaa"}
    it { should_not be_valid }
  end
  
  describe "when the size is blank" do
    before { @shoe.size = "" }
    it { should_not be_valid }
  end
  
  describe "highest" do
    before { FactoryGirl.create(:shoe, size: 20) } 
    it 'should return the highest shoe size' do
      expect(Shoe.highest).to eql(20)
    end
  end
  
  describe "lowest" do
    before { FactoryGirl.create(:shoe, size: 1)}
    it 'should return the lowest shoe size' do
      expect(Shoe.lowest).to eql(1)
    end
  end
  
  describe "average" do
    it "should return the average shoe size" do
      expect(Shoe.average_size).to eql(Shoe.average("size"))
    end
  end
  
  describe "frequence_of_size" do
    before do
      FactoryGirl.create(:shoe, size: 12)
      FactoryGirl.create(:shoe, size: 12)
      FactoryGirl.create(:shoe, size: 12)
      FactoryGirl.create(:shoe, size: 1)
      FactoryGirl.create(:shoe, size: 5)
      FactoryGirl.create(:shoe, size: 5)
    end
    it "should return the frequence of each shoe size" do
      shoe_frequency = Shoe.frequency_of_size
      expect(shoe_frequency[5]).to eql(2)
      expect(shoe_frequency[1]).to eql(1)
      expect(shoe_frequency[12]).to eql(3)
    end
  end
end
