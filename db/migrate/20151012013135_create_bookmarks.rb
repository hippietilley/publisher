class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.text :bookmark_author
      t.text :bookmark_excerpt
      t.text :bookmark_url

      t.timestamps null: false
    end
  end
end
