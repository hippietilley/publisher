require 'rails_helper'

RSpec.describe "Pagination", type: :request do
  describe "GET /page" do
    it "redirects to root" do
      get "/page"
      expect(response).to have_http_status(301)
      expect(response).to redirect_to("/")
    end
  end

  describe "GET /page/1" do
    it "redirects to root" do
      get "/page/1"
      expect(response).to have_http_status(301)
      expect(response).to redirect_to("/")
    end
  end
end
