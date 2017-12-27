class AddHidersToPages < ActiveRecord::Migration[4.2]
  def up
    add_column :pages, :hide_header, :boolean, default: false
    add_column :pages, :hide_footer, :boolean, default: false
    add_column :pages, :hide_layout, :boolean, default: false
  end

  def down
    remove_column :pages, :hide_header
    remove_column :pages, :hide_footer
    remove_column :pages, :hide_layout
  end
end