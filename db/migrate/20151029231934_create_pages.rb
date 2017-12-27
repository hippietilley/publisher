class CreatePages < ActiveRecord::Migration[4.2]
  def change
    create_table :pages do |t|
      t.boolean :show_in_nav

      t.timestamps null: false
    end
  end
end
