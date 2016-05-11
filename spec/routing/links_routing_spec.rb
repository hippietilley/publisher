require "rails_helper"

RSpec.describe Admin::LinksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get:"/admin/links").to route_to("admin/links#index")
    end

    it "routes to #new" do
      expect(get:"/admin/links/new").to route_to("admin/links#new")
    end

    it "routes to #show" do
      expect(get:"/admin/links/1").to route_to("admin/links#show", id: "1")
    end

    it "routes to #edit" do
      expect(get:"/admin/links/1/edit").to route_to("admin/links#edit", id: "1")
    end

    it "routes to #create" do
      expect(post:"/admin/links").to route_to("admin/links#create")
    end

    it "routes to #update via PUT" do
      expect(put:"/admin/links/1").to route_to("admin/links#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/links/1").to route_to("admin/links#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete:"/admin/links/1").to route_to("admin/links#destroy", id: "1")
    end

  end
end
