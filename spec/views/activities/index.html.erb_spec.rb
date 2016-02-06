# require 'rails_helper'
#
# RSpec.describe "activities/index", type: :view do
#   before(:each) do
#     assign(:activities, [
#       Activity.create!(
#         :name => "Name",
#         :amount => "Amount",
#         :unit => "Unit",
#         :converted_amount => "Alternate Amount",
#         :converted_unit => "Alternate Unit"
#       ),
#       Activity.create!(
#         :name => "Name",
#         :amount => "Amount",
#         :unit => "Unit",
#         :converted_amount => "Alternate Amount",
#         :converted_unit => "Alternate Unit"
#       )
#     ])
#   end
#
#   it "renders a list of activities" do
#     render
#     assert_select "tr>td", :text => "Name".to_s, :count => 2
#     assert_select "tr>td", :text => "Amount".to_s, :count => 2
#     assert_select "tr>td", :text => "Unit".to_s, :count => 2
#     assert_select "tr>td", :text => "Alternate Amount".to_s, :count => 2
#     assert_select "tr>td", :text => "Alternate Unit".to_s, :count => 2
#   end
# end
