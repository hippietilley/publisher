class CreateLicenses < ActiveRecord::Migration[4.2]
  def change
    create_table :licenses do |t|
      t.string :name
      t.string :short_code
      t.text :description
      t.text :url

      t.timestamps null: false
    end
  end
end
