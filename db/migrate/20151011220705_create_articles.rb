class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :tags

      t.timestamps null: false
    end
  end
end
