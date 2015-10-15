require 'rails_helper'

RSpec.describe "notes/show", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      content: "MyText",
      slug: "MyText",
      in_reply_to: "MyText",
      tags: "MyText",
      private: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
