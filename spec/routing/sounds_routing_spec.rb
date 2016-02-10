require "rails_helper"

RSpec.describe SoundsController, type: :routing do
  describe "routing" do

    def sound_params
      { year: "2013", month: "11", day: "02", slug: "farmhouse-conf-5-collapse" }
    end

    def sound_path
      "/sounds/2013/11/02/farmhouse-conf-5-collapse"
    end

    it "routes to #index" do
      expect(:get => "/sounds").to route_to("sounds#index")
    end

    it "routes to #new" do
      expect(:get => "/sounds/new").to route_to("sounds#new")
    end

    it "routes to #show" do
      expect(:get => sound_path).to route_to("sounds#show", sound_params)
    end

    it "routes to #edit" do
      expect(:get => "#{sound_path}/edit").to route_to("sounds#edit", sound_params)
    end

    it "routes to #create" do
      expect(:post => "/sounds").to route_to("sounds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => sound_path).to route_to("sounds#update", sound_params)
    end

    it "routes to #update via PATCH" do
      expect(:patch => sound_path).to route_to("sounds#update", sound_params)
    end

    it "routes to #destroy" do
      expect(:delete => sound_path).to route_to("sounds#destroy", sound_params)
    end

  end
end
