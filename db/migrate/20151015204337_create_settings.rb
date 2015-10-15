class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string  :name, :key
      t.text    :content
      t.boolean :editable, default: true

      t.timestamps null: false
    end
  end
end
