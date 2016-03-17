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
  
  def site_photo
    if @owner.nil? || @owner.avatar.nil? 
      render plain: "404 Not Found", status: 404
    else
      uri    = URI.parse(@owner.avatar)
      format = uri.path.split(".").last.try(:downcase)
      path   = ["/photo", format].join(".")

      if format == params[:format]
        response = Net::HTTP.get_response(URI(@owner.avatar))
        return send_data(response.body, type: response.content_type, disposition: "inline")
      end

      redirect_to path, status: 302
    end
  end
end
