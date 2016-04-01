# require 'rails_helper'
#
# RSpec.describe "admin/tags/edit", type: :view do
#   before(:each) do
#     @admin_tag = assign(:admin_tag, Admin::Tag.create!(
#       :name => "MyString",
#       :slug => "MyString",
#       :namespace => "MyString",
#       :predicate => "MyString"
#     ))
#   end
#
#   it "renders the edit admin_tag form" do
#     render
#
#     assert_select "form[action=?][method=?]", admin_tag_path(@admin_tag), "post" do
#
#       assert_select "input#admin_tag_name[name=?]", "admin_tag[name]"
#
#       assert_select "input#admin_tag_slug[name=?]", "admin_tag[slug]"
#
#       assert_select "input#admin_tag_namespace[name=?]", "admin_tag[namespace]"
#
#       assert_select "input#admin_tag_predicate[name=?]", "admin_tag[predicate]"
#     end
#   end
# end
