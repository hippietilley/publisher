# require 'rails_helper'
#
# RSpec.describe "notes/index", type: :view do
#   before(:each) do
#     assign(:notes, [
#       Note.create!(
#         content: "MyText",
#         slug: "MyText",
#         in_reply_to: "MyText",
#         tags: "MyText",
#         private: false
#       ),
#       Note.create!(
#         content: "MyText",
#         slug: "MyText",
#         in_reply_to: "MyText",
#         tags: "MyText",
#         private: false
#       )
#     ])
#   end
#
#   it "renders a list of notes" do
#     render
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: false.to_s, count: 2
#   end
# end
