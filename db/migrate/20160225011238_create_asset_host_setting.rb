class CreateAssetHostSetting < ActiveRecord::Migration
  def up
    s          = Setting.new
    s.name     = "Asset Host"
    s.content  = ""
    s.editable = true
    s.save(validate: false)
  end

  def down
    Setting.of("asset_host").destroy
  end
end
