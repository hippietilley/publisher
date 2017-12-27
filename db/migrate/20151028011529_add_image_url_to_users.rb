class AddImageUrlToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :avatar, :text
  end
end
