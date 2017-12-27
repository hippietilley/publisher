class CreateProviders < ActiveRecord::Migration[4.2]
  def change
    create_table :providers do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.string :secret

      t.timestamps null: false
    end
  end
end
