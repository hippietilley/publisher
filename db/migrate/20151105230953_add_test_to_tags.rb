class AddTestToTags < ActiveRecord::Migration[4.2]
  def change
    # just to test auto migrating from .heroku/bin/release
    add_column :tags, :test, :string
  end
end
