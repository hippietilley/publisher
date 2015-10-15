require 'rails_helper'

RSpec.describe "bookmarks/new", type: :view do
  before(:each) do
    assign(:bookmark, Bookmark.new(
      title: "MyText",
      subtitle: "MyText",
      content: "MyText",
      bookmark_author: "MyText",
      bookmark_excerpt: "MyText",
      bookmark_url: "MyText",
      slug: "MyText",
      in_reply_to: "MyText",
      tags: "MyText",
      private: false
    ))
  end

  it "renders new bookmark form" do
    render

    assert_select "form[action=?][method=?]", bookmarks_path, "post" do

      assert_select "textarea#bookmark_title[name=?]", "bookmark[title]"

      assert_select "textarea#bookmark_subtitle[name=?]", "bookmark[subtitle]"

      assert_select "textarea#bookmark_content[name=?]", "bookmark[content]"

      assert_select "textarea#bookmark_bookmark_author[name=?]", "bookmark[bookmark_author]"

      assert_select "textarea#bookmark_bookmark_excerpt[name=?]", "bookmark[bookmark_excerpt]"

      assert_select "textarea#bookmark_bookmark_url[name=?]", "bookmark[bookmark_url]"

      assert_select "textarea#bookmark_slug[name=?]", "bookmark[slug]"

      assert_select "textarea#bookmark_in_reply_to[name=?]", "bookmark[in_reply_to]"

      assert_select "textarea#bookmark_tags[name=?]", "bookmark[tags]"

      assert_select "input#bookmark_private[name=?]", "bookmark[private]"
    end
  end
end
