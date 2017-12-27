class AddActivityVerbToActivities < ActiveRecord::Migration[4.2]
  def change
    add_column :activities, :activity_verb, :string
  end
end
