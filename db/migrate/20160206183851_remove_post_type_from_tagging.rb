class RemovePostTypeFromTagging < ActiveRecord::Migration[4.2]
  def change
    remove_column :taggings, :post_type
  end
end
