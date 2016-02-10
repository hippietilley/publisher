require "rails_helper"

RSpec.describe VideosController, type: :routing do
  describe "routing" do

    def video_params
      { year: "2013", month: "11", day: "02", slug: "farmhouse-conf-5-collapse" }
    end

    def video_path
      "/videos/2013/11/02/farmhouse-conf-5-collapse"
    end

    it "routes to #index" do
      expect(:get => "/videos").to route_to("videos#index")
    end

    it "routes to #new" do
      expect(:get => "/videos/new").to route_to("videos#new")
    end

    it "routes to #show" do
      expect(:get => video_path).to route_to("videos#show", video_params)
    end

    it "routes to #edit" do
      expect(:get => "#{video_path}/edit").to route_to("videos#edit", video_params)
    end

    it "routes to #create" do
      expect(:post => "/videos").to route_to("videos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => video_path).to route_to("videos#update", video_params)
    end

    it "routes to #update via PATCH" do
      expect(:patch => video_path).to route_to("videos#update", video_params)
    end

    it "routes to #destroy" do
      expect(:delete => video_path).to route_to("videos#destroy", video_params)
    end

  end
end
