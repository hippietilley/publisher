require 'rails_helper'

RSpec.describe "settings/show", type: :view do
  before(:each) do
    @setting = assign(:setting, Setting.create!(
      :name => "Name",
      :key => "Key",
      :content => "MyText",
      :editable => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Key/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
