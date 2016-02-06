require "rails_helper"

RSpec.describe SyndicatorsController, type: :controller do
  fixtures :users, :settings
  let!(:user) { users(:user) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe "POST 'create'" do
    fixtures :posts, :providers
    let(:note)           { posts(:note) }
    let(:provider)       { providers(:twitter) }
    let(:twitter_client) { double("Twitter::Rest::Client") }
    let(:syndicator)     { double("Sydicator") }
    let(:make_request!)  { post :create, id: note.id, post_type: "notes", service: :twitter }
    let(:tweet)          { double("Tweet", url: "http://example.com/") }

    before do
      allow(Syndicator).to receive(:for).with("twitter") { syndicator }
      allow(syndicator).to receive(:valid?) { true }
      user.providers << provider
      allow(Twitter::REST::Client).to receive(:new) { twitter_client }
      allow(twitter_client).to receive(:update) { tweet }
    end

    it "uses the twitter gem to syndicate to twitter" do
      expect(twitter_client).to receive(:update) { tweet }
      make_request!
    end

    it "creates a Syndication object" do
      expect { make_request! }.to change { Syndication.count }.by(1)
    end

    context "when not logged in" do
      it "redirects to the sign in page" do
        allow(controller).to receive(:current_user) { nil }
        post :create, id: note.id, post_type: "notes", service: :twitter
        expect(response).to redirect_to signin_path
      end
    end

    context "when Setting keys for service are not set" do
      it "redirects to settings page" do
        Setting.destroy_all
        allow(syndicator).to receive(:valid?) { false }
        post :create, id: note.id, post_type: "notes", service: :twitter
        expect(response).to redirect_to settings_path
      end
    end
  end
end
