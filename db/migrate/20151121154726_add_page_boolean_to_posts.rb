class AddPageBooleanToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :page, :boolean, default: false
  end
end
