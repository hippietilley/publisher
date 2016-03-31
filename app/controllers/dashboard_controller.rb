class DashboardController < ApplicationController
  def new
    @page_title = "Dashboard"
    @slug = "dashboard"
    render layout: "admin"
  end
end
