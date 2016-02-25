class AboutController < ApplicationController
  def index
  end

  def public_key
    @public_key = Setting.where(name: "Public Key").first
    render layout: false
  end
  
  def micropub
    render text: "Planned Micropub endpoint"
  end
end
