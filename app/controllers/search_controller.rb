class SearchController < ApplicationController
  def index
    puts "in search > index"
    
    google_url  = "//www.google.com/search?q="
    google_url << params[:q]
    # site search
    google_url << "&as_sitesearch="
    google_url << setting(:domain)
    # sort by date
    google_url << "&tbs=sbd:1,cdr:1,cd_min:1/1/1999"
    
    return redirect_to(google_url)
  end
end
