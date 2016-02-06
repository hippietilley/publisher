# require 'rails_helper'
#
# RSpec.describe "sounds/index", type: :view do
#   before(:each) do
#     assign(:sounds, [
#       Sound.create!(
#         title: "MyText",
#         subtitle: "MyText",
#         content: "MyText",
#         slug: "MyText",
#         in_reply_to: "MyText",
#         tags: "MyText",
#         private: false,
#         image_url: "MyText",
#         duration: 1,
#         enclosure_url: "MyText"
#       ),
#       Sound.create!(
#         title: "MyText",
#         subtitle: "MyText",
#         content: "MyText",
#         slug: "MyText",
#         in_reply_to: "MyText",
#         tags: "MyText",
#         private: false,
#         image_url: "MyText",
#         duration: 1,
#         enclosure_url: "MyText"
#       )
#     ])
#   end
#
#   it "renders a list of sounds" do
#     render
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: false.to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: 1.to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#   end
# end
