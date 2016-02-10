require "rails_helper"

RSpec.describe ActivitiesController, type: :routing do
  describe "routing" do

    def activitiy_params
      { year: "2016", month: "02", day: "14", slug: "weight-137-5-lbs" }
    end

    def activitiy_path
      "/activities/2016/02/14/weight-137-5-lbs"
    end

    it "routes to activities Atom feed" do
      expect(get: "/activities/feed").to route_to("activities#index", format: "atom")
    end

    it "routes to #index" do
      expect(get: "/activities").to route_to("activities#index")
    end

    it "routes to #new" do
      expect(get: "/activities/new").to route_to("activities#new")
    end

    it "routes to #show" do
      expect(get: activitiy_path).to route_to("activities#show", activitiy_params)
    end

    it "routes to #edit" do
      expect(get: "#{activitiy_path}/edit").to route_to("activities#edit", activitiy_params)
    end

    it "routes to #create" do
      expect(post: "/activities").to route_to("activities#create")
    end

    it "routes to #update via PUT" do
      expect(put: activitiy_path).to route_to("activities#update", activitiy_params)
    end

    it "routes to #update via PATCH" do
      expect(patch: activitiy_path).to route_to("activities#update", activitiy_params)
    end

    it "routes to #destroy" do
      expect(delete: activitiy_path).to route_to("activities#destroy", activitiy_params)
    end

  end
end
