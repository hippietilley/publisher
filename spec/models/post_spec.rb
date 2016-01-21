require 'rails_helper'

RSpec.describe Post, type: :model do
  fixtures :posts
  let(:post) { posts(:post) }
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
