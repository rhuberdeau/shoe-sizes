class AddFriendToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :friend_id, :integer
  end
end
