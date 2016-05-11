require "rails_helper"

RSpec.describe Admin::SettingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get:"/admin/settings").to route_to("admin/settings#index")
    end

    it "routes to #edit" do
      expect(get:"/admin/settings/1/edit").to route_to("admin/settings#edit", id: "1")
    end

    it "routes to #update via PUT" do
      expect(put:"/admin/settings/1").to route_to("admin/settings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch:"/admin/settings/1").to route_to("admin/settings#update", id: "1")
    end

  end
end
