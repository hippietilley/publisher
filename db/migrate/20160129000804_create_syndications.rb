class CreateSyndications < ActiveRecord::Migration[4.2]
  def change
    create_table :syndications do |t|
      t.integer :post_id
      t.string :name
      t.text :url

      t.timestamps null: false
    end
  end
end
