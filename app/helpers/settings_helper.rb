module SettingsHelper
  def setting(key)
    Setting.where(key: key).first.try(:content)
  end
end
