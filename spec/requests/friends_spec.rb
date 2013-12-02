require 'spec_helper'

describe "Friends" do
  describe "GET /friends" do
    before { 10.times { FactoryGirl.create(:friend) } }
    
    it "works! (now write some real specs)" do
      get friends_path
      expect(response.status).to be(200)
    end
  end
  
  describe "show page" do
    before { @friend = create(:friend)}
    it "should list a friend" do
      visit friend_path(@friend)
      expect(page).to have_content(@friend.name)
    end
  end
end
