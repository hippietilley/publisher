class DeleteMicropubEndpointSetting < ActiveRecord::Migration
  def up
    Setting.of("micropub_endpoint").destroy
  end
  
  def down
    s          = Setting.new
    s.name     = "Micropub Endpoint"
    s.content  = "/micropub"
    s.editable = false
    s.save(validate: false)
  end
end
