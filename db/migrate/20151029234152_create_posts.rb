class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text     :title,
                 :subtitle,
                 :content,
                 :slug,
                 :in_reply_to
      t.boolean  :private, default: false
      t.datetime :published_at
      t.integer  :post_type_id
      t.string   :post_type_type

      t.timestamps null: false
    end
  end
end
