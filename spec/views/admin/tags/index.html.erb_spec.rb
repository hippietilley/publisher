# require 'rails_helper'
#
# RSpec.describe "admin/tags/index", type: :view do
#   before(:each) do
#     assign(:admin_tags, [
#       Admin::Tag.create!(
#         :name => "Name",
#         :slug => "Slug",
#         :namespace => "Namespace",
#         :predicate => "Predicate"
#       ),
#       Admin::Tag.create!(
#         :name => "Name",
#         :slug => "Slug",
#         :namespace => "Namespace",
#         :predicate => "Predicate"
#       )
#     ])
#   end
#
#   it "renders a list of admin/tags" do
#     render
#     assert_select "tr>td", :text => "Name".to_s, :count => 2
#     assert_select "tr>td", :text => "Slug".to_s, :count => 2
#     assert_select "tr>td", :text => "Namespace".to_s, :count => 2
#     assert_select "tr>td", :text => "Predicate".to_s, :count => 2
#   end
# end
