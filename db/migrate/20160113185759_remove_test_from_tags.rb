class RemoveTestFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :test, :string
  end
end
