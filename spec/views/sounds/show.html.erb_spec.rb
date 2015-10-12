require 'rails_helper'

RSpec.describe "sounds/show", type: :view do
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
    expect(rendered).to match(/MyText/)
  end
end
