class DashboardController < ApplicationController
  before_action :authorize
  before_action :set_on_admin_page

  def new
    @page_title = "Dashboard"
    @slug = "dashboard"
    render layout: "admin"
  end
end
