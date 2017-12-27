require "rails_helper"

RSpec.describe PostsController, type: :routing do
  describe "routing" do

    it "routes to root" do
      expect(get: "/").to route_to("root#index")
    end

    it "routes to root Atom feed" do
      expect(get: "/feed").to route_to("posts#index", format: "atom")
    end

  end
end
