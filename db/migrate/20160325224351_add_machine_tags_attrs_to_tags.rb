class AddMachineTagsAttrsToTags < ActiveRecord::Migration[4.2]
  def change
    add_column :tags, :namespace, :string
    add_column :tags, :predicate, :string
  end
end