class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.text :title
      t.text :subtitle
      t.text :content
      t.text :slug
      t.text :in_reply_to
      t.text :tags
      t.datetime :published_at
      t.boolean :private
      t.text :image_url
      t.integer :duration
      t.datetime :recorded_at
      t.text :enclosure_url

      t.timestamps null: false
    end
  end
end
