require "rails_helper"

RSpec.describe SettingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/settings").to route_to("settings#index")
    end

    it "routes to #edit" do
      expect(get: "/settings/1/edit").to route_to("settings#edit", id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/settings/1").to route_to("settings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch:  "/settings/1").to route_to("settings#update", id: "1")
    end

  end
end
