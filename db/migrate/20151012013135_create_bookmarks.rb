class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.text :title
      t.text :subtitle
      t.text :content
      t.text :bookmark_author
      t.text :bookmark_excerpt
      t.text :bookmark_url
      t.text :slug
      t.text :in_reply_to
      t.text :tags
      t.datetime :published_at
      t.boolean :private

      t.timestamps null: false
    end
  end
end
