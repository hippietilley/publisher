require 'rails_helper'

RSpec.describe "activities/show", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :name => "Name",
      :amount => "Amount",
      :unit => "Unit",
      :converted_amount => "Alternate Amount",
      :converted_unit => "Alternate Unit"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Amount/)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(/Alternate Amount/)
    expect(rendered).to match(/Alternate Unit/)
  end
end
