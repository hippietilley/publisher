require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :title => "MyText",
        :subtitle => "MyText",
        :content => "MyText",
        :slug => "MyText",
        :in_reply_to => "MyText",
        :tags => "MyText",
        :private => false,
        :image_url => "MyText",
        :width => 1,
        :height => 2
      ),
      Photo.create!(
        :title => "MyText",
        :subtitle => "MyText",
        :content => "MyText",
        :slug => "MyText",
        :in_reply_to => "MyText",
        :tags => "MyText",
        :private => false,
        :image_url => "MyText",
        :width => 1,
        :height => 2
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
