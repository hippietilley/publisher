class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :title
      t.text :subtitle
      t.text :content
      t.text :slug
      t.text :in_reply_to
      t.text :tags
      t.datetime :published_at
      t.boolean :private
      t.text :image_url
      t.integer :width
      t.integer :height
      t.datetime :captured_at

      t.timestamps null: false
    end
  end
end
