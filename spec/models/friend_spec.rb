require 'spec_helper'

describe Friend do
  before do
    @friend = build(:friend)
  end
  
  subject { @friend }
  
  it { should respond_to :name }
  it { should respond_to :age }
  
  describe "without a name" do
    before { @friend.name = ""}
    it { should_not be_valid}
  end
  
  describe "without an age" do
    before { @friend.age = ""}
    it { should_not be_valid}
  end
  
  describe "age must be a number" do
    before { @friend.age = "aaa"}
    it { should_not be_valid }
  end
  
  describe "when age is less than zero" do
    before { @friend.age = "-1" }
    it { should_not be_valid }
  end
end
