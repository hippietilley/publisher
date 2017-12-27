require 'rails_helper'

RSpec.describe Post, type: :model do
  fixtures :posts, :settings, :users
  let(:user) { users(:user) }
  let(:post) { posts(:post) }

  describe ".url" do
    it "adds Setting protocol, domain, and post path" do
      expect(post.url).to eq "http://test.host#{post.path}"
    end
  end

  describe ".syndication_content" do
    it "truncates and elipsizes a long name" do
      long_name = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
      allow(post).to receive(:name) { long_name }
      expect(post.syndication_content).to include "...\n\n"
    end

    it "adds the url to a long name" do
      long_name = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
      allow(post).to receive(:name) { long_name }
      allow(post).to receive(:url)  { "http://test.host" }
      expect(post.syndication_content).to eq "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore m...\n\nhttp://test.host"
    end

    it "doesn't add the url to a short name" do
      allow(post).to receive(:name) { "I'm a name" }
      allow(post).to receive(:url)  { "http://test.host" }
      expect(post.syndication_content).to eq "I'm a name"
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

  describe ".slug" do
    it "generates valid slug on create" do
      new_post = Post.create!(content: "no slug given", published_at: Time.now, user: user, post_type_type: Note)
      expect(new_post.slug).to eq "no-slug-given"
    end

    it "validates new slug on update" do
      post.update(slug: "something in valid")
      expect(post.slug).to eq "something-in-valid"
    end

    it "re-creates a slug from content's value when re-saved with a blank slug" do
      post.update(slug: nil)
      expect(post.slug).to eq "lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit-sed-do-eiusmod-tempor-incididunt-ut-labore-et-dolore-magna-aliqua-ut-enim-ad-minim-veniam"
    end

    it "increments a duplicate generated slug" do
      post.update(slug: "lorem-ipsum")
      new_post = Post.create!(content: "Lorem Ipsum!", published_at: Time.now, user: user, post_type_type: Note)
      expect(new_post.slug).to eq "lorem-ipsum-1"
    end

    # it "increments a duplicated human entered slug" do
    #   post.update(slug: "lorem-ipsum")
    #   new_post = Post.create!(content: "Whatevers clever", slug: "lorem-ipsum", published_at: Time.now, post_type_type: Note)
    #   expect(new_post.slug).to eq "lorem-ipsum-1"
    # end
  end
end
