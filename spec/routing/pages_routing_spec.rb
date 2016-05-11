require "rails_helper"

RSpec.describe PagesController, type: :routing do
  describe "routing" do

    def page_params
      { year: "2013", month: "09", day: "07", slug: "resume" }
    end

    def page_path
      "/resume"
    end

    it "routes to #index" do
      expect(get: "/pages").to route_to("pages#index")
    end

    it "routes to #new" do
      expect(get: "/pages/new").to route_to("pages#new")
    end

    it "routes to #show" do
      expect(get: "/resume").to route_to("pages#show", slug: "resume")
    end

    # TODO
    # it "routes to #edit" do
    #   expect(get: "/pages/1/edit").to route_to("articles#edit", id: "1")
    # end
    #
    # it "routes to #create" do
    #   expect(post: "/pages").to route_to("articles#create")
    # end
    #
    # it "routes to #update via PUT" do
    #   expect(put: "/pages/1").to route_to("articles#update", id: "1")
    # end
    #
    # it "routes to #update via PATCH" do
    #   expect(patch:  "/pages/1").to route_to("articles#update", id: "1")
    # end
    #
    # it "routes to #destroy" do
    #   expect(delete: "/pages/1").to route_to("articles#destroy", id: "1")
    # end

  end
end
