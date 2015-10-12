require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :title => "MyText",
        :subtitle => "MyText",
        :content => "MyText",
        :slug => "MyText",
        :in_reply_to => "MyText",
        :tags => "MyText",
        :private => false,
        :image_url => "MyText",
        :width => 1,
        :height => 2,
        :duration => 3,
        :enclosure_url => "MyText"
      ),
      Video.create!(
        :title => "MyText",
        :subtitle => "MyText",
        :content => "MyText",
        :slug => "MyText",
        :in_reply_to => "MyText",
        :tags => "MyText",
        :private => false,
        :image_url => "MyText",
        :width => 1,
        :height => 2,
        :duration => 3,
        :enclosure_url => "MyText"
      )
    ])
  end

  it "renders a list of videos" do
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
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
