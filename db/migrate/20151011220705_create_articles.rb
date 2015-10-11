class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :subtitle
      t.text :content
      t.text :slug
      t.text :in_reply_to
      t.text :tags
      t.datetime :published_at
      t.boolean :private

      t.timestamps null: false
    end
  end
end
