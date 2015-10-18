module SettingsHelper
  def setting(key)
    Setting.where(key: key).first.content
  end
end
