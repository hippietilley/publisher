class CreateHomePageSetting < ActiveRecord::Migration
  def up
    s          = Setting.new
    s.name     = "Home Page"
    s.content  = ""
    s.editable = true
    s.save(validate: false)
  end

  def down
    Setting.of("home_page").destroy
  end
end
