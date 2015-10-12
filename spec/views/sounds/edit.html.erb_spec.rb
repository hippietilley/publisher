require 'rails_helper'

RSpec.describe "sounds/edit", type: :view do
  before(:each) do
    @sound = assign(:sound, Sound.create!(
      :title => "MyText",
      :subtitle => "MyText",
      :content => "MyText",
      :slug => "MyText",
      :in_reply_to => "MyText",
      :tags => "MyText",
      :private => false,
      :image_url => "MyText",
      :duration => 1,
      :enclosure_url => "MyText"
    ))
  end

  it "renders the edit sound form" do
    render

    assert_select "form[action=?][method=?]", sound_path(@sound), "post" do

      assert_select "textarea#sound_title[name=?]", "sound[title]"

      assert_select "textarea#sound_subtitle[name=?]", "sound[subtitle]"

      assert_select "textarea#sound_content[name=?]", "sound[content]"

      assert_select "textarea#sound_slug[name=?]", "sound[slug]"

      assert_select "textarea#sound_in_reply_to[name=?]", "sound[in_reply_to]"

      assert_select "textarea#sound_tags[name=?]", "sound[tags]"

      assert_select "input#sound_private[name=?]", "sound[private]"

      assert_select "textarea#sound_image_url[name=?]", "sound[image_url]"

      assert_select "input#sound_duration[name=?]", "sound[duration]"

      assert_select "textarea#sound_enclosure_url[name=?]", "sound[enclosure_url]"
    end
  end
end
