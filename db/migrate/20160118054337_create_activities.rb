class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity_type
      t.string :amount
      t.string :unit
      t.string :converted_amount
      t.string :converted_unit
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps null: false
    end
  end
end
