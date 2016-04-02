class DashboardController < ApplicationController
  before_action :authorize
  before_action :set_on_admin_page
  layout "admin"

  def new
    @page_title = "NEW Post"
    @slug = "new"
  end

  def index
    @page_title = "Dashboard"
    @slug = "dashboard"
  end
end
