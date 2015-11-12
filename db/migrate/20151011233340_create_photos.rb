class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :tags
      t.text :image_url
      t.integer :width
      t.integer :height
      t.datetime :captured_at

      t.timestamps null: false
    end
  end
end
