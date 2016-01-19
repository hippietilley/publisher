class AddActivityVerbToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :activity_verb, :string
  end
end
