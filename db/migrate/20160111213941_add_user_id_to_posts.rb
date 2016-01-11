class AddUserIdToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :user_id, :integer, default: 1
  end
  
  def down
    remove_column :posts, :user_id
  end
end
