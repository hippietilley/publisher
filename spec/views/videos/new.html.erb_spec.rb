# require 'rails_helper'
#
# RSpec.describe "videos/new", type: :view do
#   before(:each) do
#     assign(:video, Video.new(
#       title: "MyText",
#       subtitle: "MyText",
#       content: "MyText",
#       slug: "MyText",
#       in_reply_to: "MyText",
#       tags: "MyText",
#       private: false,
#       image_url: "MyText",
#       width: 1,
#       height: 1,
#       duration: 1,
#       enclosure_url: "MyText"
#     ))
#   end
#
#   it "renders new video form" do
#     render
#
#     assert_select "form[action=?][method=?]", videos_path, "post" do
#
#       assert_select "textarea#video_title[name=?]", "video[title]"
#
#       assert_select "textarea#video_subtitle[name=?]", "video[subtitle]"
#
#       assert_select "textarea#video_content[name=?]", "video[content]"
#
#       assert_select "textarea#video_slug[name=?]", "video[slug]"
#
#       assert_select "textarea#video_in_reply_to[name=?]", "video[in_reply_to]"
#
#       assert_select "textarea#video_tags[name=?]", "video[tags]"
#
#       assert_select "input#video_private[name=?]", "video[private]"
#
#       assert_select "textarea#video_image_url[name=?]", "video[image_url]"
#
#       assert_select "input#video_width[name=?]", "video[width]"
#
#       assert_select "input#video_height[name=?]", "video[height]"
#
#       assert_select "input#video_duration[name=?]", "video[duration]"
#
#       assert_select "textarea#video_enclosure_url[name=?]", "video[enclosure_url]"
#     end
#   end
# end
