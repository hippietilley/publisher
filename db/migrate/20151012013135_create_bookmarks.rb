class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.text :bookmark_author
      t.text :bookmark_excerpt
      t.text :bookmark_url
      t.text :tags

      t.timestamps null: false
    end
  end
end
