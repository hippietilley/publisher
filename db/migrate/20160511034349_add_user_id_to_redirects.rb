class AddUserIdToRedirects < ActiveRecord::Migration[4.2]
  def up
    add_column :redirects, :user_id, :integer

    user = User.first
    Redirect.all.each do |r|
      r.user_id = user.id
      r.save!
    end
  end

  def down
    remove_column :redirects, :user_id, :integer
  end
end
