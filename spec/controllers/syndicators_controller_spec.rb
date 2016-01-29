require 'rails_helper'

RSpec.describe SyndicatorsController, type: :controller do
  fixtures :users
  let!(:user) { users(:user) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe "POST 'create'" do
    fixtures :posts, :providers
    let(:note)           { posts(:note) }
    let(:provider)       { providers(:twitter) }
    let(:twitter_client) { double("Twitter::Rest::Client") }
    let(:syndicator)     { Syndicator.for(:twitter) }

    before do
      allow(syndicator).to receive(:valid?) { false }
    end

    it "uses the twitter gem to syndicate to twitter" do
      user.providers << provider
      note.update(content: "I'm content")
      allow(Twitter::REST::Client).to receive(:new) { twitter_client }
      expect(twitter_client).to receive(:update).with("I'm content")
      post :create, id: note.id, post_type: "notes", service: :twitter
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
