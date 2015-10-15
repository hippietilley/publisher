require 'rails_helper'

RSpec.describe "settings/new", type: :view do
  before(:each) do
    assign(:setting, Setting.new(
      :name => "MyString",
      :key => "MyString",
      :content => "MyText",
      :editable => false
    ))
  end

  it "renders new setting form" do
    render

    assert_select "form[action=?][method=?]", settings_path, "post" do

      assert_select "input#setting_name[name=?]", "setting[name]"

      assert_select "input#setting_key[name=?]", "setting[key]"

      assert_select "textarea#setting_content[name=?]", "setting[content]"

      assert_select "input#setting_editable[name=?]", "setting[editable]"
    end
  end
end
