require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :content => "MyText",
      :slug => "MyText",
      :in_reply_to => "MyText",
      :tags => "MyText",
      :private => false
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do

      assert_select "textarea#note_content[name=?]", "note[content]"

      assert_select "textarea#note_slug[name=?]", "note[slug]"

      assert_select "textarea#note_in_reply_to[name=?]", "note[in_reply_to]"

      assert_select "textarea#note_tags[name=?]", "note[tags]"

      assert_select "input#note_private[name=?]", "note[private]"
    end
  end
end
