class RemovePostTypeFromTagging < ActiveRecord::Migration
  def change
    remove_column :taggings, :post_type
  end
end
