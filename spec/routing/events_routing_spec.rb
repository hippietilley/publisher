require "rails_helper"

RSpec.describe EventsController, type: :routing do
  describe "routing" do

    def event_params
      { year: "2013", month: "11", day: "02", slug: "farmhouse-conf-5-collapse" }
    end

    def event_path
      "/events/2013/11/02/farmhouse-conf-5-collapse"
    end

    it "routes to events Atom feed" do
      expect(get: "/events/feed").to route_to("events#index", format: "atom")
    end

    it "routes to #index" do
      expect(get: "/events").to route_to("events#index")
    end

    it "routes to #new" do
      expect(get: "/events/new").to route_to("events#new")
    end

    it "routes to #show" do
      expect(get: event_path).to route_to("events#show", event_params)
    end

    it "routes to #edit" do
      expect(get: "#{event_path}/edit").to route_to("events#edit", event_params)
    end

    it "routes to #create" do
      expect(post: "/events").to route_to("events#create")
    end

    it "routes to #update via PUT" do
      expect(put: event_path).to route_to("events#update", event_params)
    end

    it "routes to #update via PATCH" do
      expect(patch: event_path).to route_to("events#update", event_params)
    end

    it "routes to #destroy" do
      expect(delete: event_path).to route_to("events#destroy", event_params)
    end

  end
end
