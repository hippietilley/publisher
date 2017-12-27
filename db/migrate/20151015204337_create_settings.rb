class CreateSettings < ActiveRecord::Migration[4.2]
  def change
    create_table :settings do |t|
      t.string  :name, :key
      t.text    :content
      t.boolean :editable, default: true

      t.timestamps null: false
    end
  end
end
