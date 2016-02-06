# require 'rails_helper'
#
# RSpec.describe "articles/new", type: :view do
#   before(:each) do
#     assign(:article, Article.new(
#       title: "MyText",
#       subtitle: "MyText",
#       content: "MyText",
#       slug: "MyText",
#       in_reply_to: "MyText",
#       tags: "MyText",
#       private: false
#     ))
#   end
#
#   it "renders new article form" do
#     render
#
#     assert_select "form[action=?][method=?]", articles_path, "post" do
#
#       assert_select "textarea#article_title[name=?]", "article[title]"
#
#       assert_select "textarea#article_subtitle[name=?]", "article[subtitle]"
#
#       assert_select "textarea#article_content[name=?]", "article[content]"
#
#       assert_select "textarea#article_slug[name=?]", "article[slug]"
#
#       assert_select "textarea#article_in_reply_to[name=?]", "article[in_reply_to]"
#
#       assert_select "textarea#article_tags[name=?]", "article[tags]"
#
#       assert_select "input#article_private[name=?]", "article[private]"
#     end
#   end
# end
