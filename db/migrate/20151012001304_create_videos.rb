class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
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
      t.datetime :taken_at
      t.integer :duration
      t.datetime :taken_at
      t.text :enclosure_url

      t.timestamps null: false
    end
  end
end
