require 'spec_helper'

describe "Friends" do
  describe "GET /friends" do
    before { 10.times { FactoryGirl.create(:friend) } }
    
    it "works! (now write some real specs)" do
      get friends_path
      expect(response.status).to be(200)
    end
    
    it "a link for a new friend" do
      visit friends_path
      expect(page).to have_link "New Friend"
    end
  end
  
  describe "show page" do
    before { @friend = create(:friend)}
    it "should list a friend" do
      visit friend_path(@friend)
      expect(page).to have_content(@friend.name)
    end
  end
  
  describe "edit page" do
    before { @friend = create(:friend) }
    it "should have a field for shoe size" do
      visit edit_friend_path(@friend)
      expect(page).to have_field "friend[shoe_attributes][size]"
    end
    
    it "should only have one field for shoe size" do
      @friend.create_shoe(size: "8")
      visit edit_friend_path(@friend)
      expect(page.all("#friend_shoe_attributes_size").length).to eql(1)
    end
  end
end
