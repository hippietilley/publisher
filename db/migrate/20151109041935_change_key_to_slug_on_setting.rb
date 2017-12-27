class ChangeKeyToSlugOnSetting < ActiveRecord::Migration[4.2]
  def change
    rename_column :settings, :key, :slug
  end
end