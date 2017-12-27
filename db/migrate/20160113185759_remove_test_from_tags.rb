class RemoveTestFromTags < ActiveRecord::Migration[4.2]
  def change
    remove_column :tags, :test, :string
  end
end
