require 'rails_helper'

RSpec.describe Post, type: :model do
  fixtures :posts, :settings
  let(:post) { posts(:post) }

  describe ".url" do
    it "adds Setting protocol, domain, and post path" do
      expect(post.url).to eq "http://example.com#{post.path}"
    end
  end

  describe ".syndication_content" do
    it "adds the url to the name" do
      allow(post).to receive(:name) { "I'm a name" }
      allow(post).to receive(:url)  { "http://example.com" }
      expect(post.syndication_content).to eq "I'm a name\n\nhttp://example.com"
    end
  end
  describe ".for" do
    it "finds private if the user exists" do
      post.update(private: true)
      expect(Post.for_user(1)).to include post
    end

    it "finds public if the user exists" do
      post.update(private: false)
      expect(Post.for_user(1)).to include post
    end

    it "finds public if the user doesn't exist" do
      post.update(private: false)
      expect(Post.for_user(nil)).to include post
    end

    it "finds public if private is nil" do
      post.update(private: nil)
      expect(Post.for_user(nil)).to include post
    end

    it "doesn't return if the user is nil" do
      post.update(private: true)
      expect(Post.for_user(nil)).to_not include post
    end

  end
end
