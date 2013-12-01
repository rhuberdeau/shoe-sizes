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
end
