require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :title => "MyText",
      :subtitle => "MyText",
      :content => "MyText",
      :slug => "MyText",
      :in_reply_to => "MyText",
      :tags => "MyText",
      :private => false
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "textarea#article_title[name=?]", "article[title]"

      assert_select "textarea#article_subtitle[name=?]", "article[subtitle]"

      assert_select "textarea#article_content[name=?]", "article[content]"

      assert_select "textarea#article_slug[name=?]", "article[slug]"

      assert_select "textarea#article_in_reply_to[name=?]", "article[in_reply_to]"

      assert_select "textarea#article_tags[name=?]", "article[tags]"

      assert_select "input#article_private[name=?]", "article[private]"
    end
  end
end
