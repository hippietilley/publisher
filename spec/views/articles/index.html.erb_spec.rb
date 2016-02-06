# require 'rails_helper'
#
# RSpec.describe "articles/index", type: :view do
#   before(:each) do
#     assign(:articles, [
#       Article.create!(
#         title: "MyText",
#         subtitle: "MyText",
#         content: "MyText",
#         slug: "MyText",
#         in_reply_to: "MyText",
#         tags: "MyText",
#         private: false
#       ),
#       Article.create!(
#         title: "MyText",
#         subtitle: "MyText",
#         content: "MyText",
#         slug: "MyText",
#         in_reply_to: "MyText",
#         tags: "MyText",
#         private: false
#       )
#     ])
#   end
#
#   it "renders a list of articles" do
#     render
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: false.to_s, count: 2
#   end
# end
