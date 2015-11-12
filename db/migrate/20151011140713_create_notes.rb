class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :tags

      t.timestamps null: false
    end
  end
end
