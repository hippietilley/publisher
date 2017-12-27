class CreateSounds < ActiveRecord::Migration[4.2]
  def change
    create_table :sounds do |t|
      t.text :image_url
      t.integer :duration
      t.datetime :captured_at
      t.text :enclosure_url

      t.timestamps null: false
    end
  end
end
