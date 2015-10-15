require 'rails_helper'

RSpec.describe "videos/show", type: :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      title: "MyText",
      subtitle: "MyText",
      content: "MyText",
      slug: "MyText",
      in_reply_to: "MyText",
      tags: "MyText",
      private: false,
      image_url: "MyText",
      width: 1,
      height: 2,
      duration: 3,
      enclosure_url: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
  end
end
