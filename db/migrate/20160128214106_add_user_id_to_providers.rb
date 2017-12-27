class AddUserIdToProviders < ActiveRecord::Migration[4.2]
  def change
    add_column :providers, :user_id, :integer
    add_index :providers, [:provider, :user_id]
  end
end
