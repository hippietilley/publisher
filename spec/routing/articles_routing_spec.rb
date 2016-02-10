require "rails_helper"

RSpec.describe ArticlesController, type: :routing do
  describe "routing" do

    def article_params
      { year: "2013", month: "09", day: "07", slug: "rorschach-and-roomba" }
    end

    def article_path
      "/articles/2013/09/07/rorschach-and-roomba"
    end

    it "routes to articles Atom feed" do
      expect(get: "/articles/feed").to route_to("articles#index", format: "atom")
    end

    it "routes to #index" do
      expect(get: "/articles").to route_to("articles#index")
    end

    it "routes to #new" do
      expect(get: "/articles/new").to route_to("articles#new")
    end

    it "routes to #show" do
      expect(get: article_path).to route_to("articles#show", article_params)
    end

    it "routes to #edit" do
      expect(get: "#{article_path}/edit").to route_to("articles#edit", article_params)
    end

    it "routes to #create" do
      expect(post: "/articles").to route_to("articles#create")
    end

    it "routes to #update via PUT" do
      expect(put: article_path).to route_to("articles#update", article_params)
    end

    it "routes to #update via PATCH" do
      expect(patch: article_path).to route_to("articles#update", article_params)
    end

    it "routes to #destroy" do
      expect(delete: article_path).to route_to("articles#destroy", article_params)
    end

  end
end
