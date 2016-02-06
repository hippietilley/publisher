# require 'rails_helper'
#
# RSpec.describe "photos/edit", type: :view do
#   before(:each) do
#     @post = assign(:photo, Photo.create!(
#       title: "MyText",
#       subtitle: "MyText",
#       content: "MyText",
#       slug: "MyText",
#       in_reply_to: "MyText",
#       tags: "MyText",
#       private: false,
#       image_url: "MyText",
#       width: 1,
#       height: 1
#     ))
#   end
#
#   it "renders the edit photo form" do
#     render
#
#     assert_select "form[action=?][method=?]", photo_path(@post), "post" do
#
#       assert_select "textarea#photo_title[name=?]", "photo[title]"
#
#       assert_select "textarea#photo_subtitle[name=?]", "photo[subtitle]"
#
#       assert_select "textarea#photo_content[name=?]", "photo[content]"
#
#       assert_select "textarea#photo_slug[name=?]", "photo[slug]"
#
#       assert_select "textarea#photo_in_reply_to[name=?]", "photo[in_reply_to]"
#
#       assert_select "textarea#photo_tags[name=?]", "photo[tags]"
#
#       assert_select "input#photo_private[name=?]", "photo[private]"
#
#       assert_select "textarea#photo_image_url[name=?]", "photo[image_url]"
#
#       assert_select "input#photo_width[name=?]", "photo[width]"
#
#       assert_select "input#photo_height[name=?]", "photo[height]"
#     end
#   end
# end
