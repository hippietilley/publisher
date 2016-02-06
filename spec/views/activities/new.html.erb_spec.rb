# require 'rails_helper'
#
# RSpec.describe "activities/new", type: :view do
#   before(:each) do
#     assign(:activity, Activity.new(
#       :name => "MyString",
#       :amount => "MyString",
#       :unit => "MyString",
#       :converted_amount => "MyString",
#       :converted_unit => "MyString"
#     ))
#   end
#
#   it "renders new activity form" do
#     render
#
#     assert_select "form[action=?][method=?]", activities_path, "post" do
#
#       assert_select "input#activity_name[name=?]", "activity[name]"
#
#       assert_select "input#activity_amount[name=?]", "activity[amount]"
#
#       assert_select "input#activity_unit[name=?]", "activity[unit]"
#
#       assert_select "input#activity_converted_amount[name=?]", "activity[converted_amount]"
#
#       assert_select "input#activity_converted_unit[name=?]", "activity[converted_unit]"
#     end
#   end
# end
