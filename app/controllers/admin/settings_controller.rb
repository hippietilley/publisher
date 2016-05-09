class Admin::SettingsController < ApplicationController
  before_action :authorize
  before_action :set_setting, only: [:edit, :update]
  before_action :all_settings
  before_action :set_on_admin_page
  layout "admin"

  def index
    @page_title = "Settings"
    @slug = "settings"
  end

  def show
    redirect_to [:admin, :settings]
  end

  def edit
    @slug = "settings"
    @setting    = Setting.find(params[:id])
    @page_title = "Editing Setting : #{@setting.name}"
  end

  def update
    @setting = Setting.find(params[:id])

    if @setting.update(setting_params)
      redirect_to [:admin, :settings], notice: "Setting was successfully updated."
    else
      render action: "edit"
    end
  end

  private

  def set_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(
      :name,
      :key,
      :content)
  end

  def all_settings
    @settings = Setting.editable.all
  end
end
