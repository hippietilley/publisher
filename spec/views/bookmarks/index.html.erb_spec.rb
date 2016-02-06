# require 'rails_helper'
#
# RSpec.describe "bookmarks/index", type: :view do
#   before(:each) do
#     assign(:bookmarks, [
#       Bookmark.create!(
#         title: "MyText",
#         subtitle: "MyText",
#         content: "MyText",
#         bookmark_author: "MyText",
#         bookmark_excerpt: "MyText",
#         bookmark_url: "MyText",
#         slug: "MyText",
#         in_reply_to: "MyText",
#         tags: "MyText",
#         private: false
#       ),
#       Bookmark.create!(
#         title: "MyText",
#         subtitle: "MyText",
#         content: "MyText",
#         bookmark_author: "MyText",
#         bookmark_excerpt: "MyText",
#         bookmark_url: "MyText",
#         slug: "MyText",
#         in_reply_to: "MyText",
#         tags: "MyText",
#         private: false
#       )
#     ])
#   end
#
#   it "renders a list of bookmarks" do
#     render
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: false.to_s, count: 2
#   end
# end
