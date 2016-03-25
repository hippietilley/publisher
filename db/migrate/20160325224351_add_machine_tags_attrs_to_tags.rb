class AddMachineTagsAttrsToTags < ActiveRecord::Migration
  def change
    add_column :tags, :namespace, :string
    add_column :tags, :predicate, :string
  end
end