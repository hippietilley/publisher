require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
    assign(:note, Note.new(
      content: "MyText",
      slug: "MyText",
      in_reply_to: "MyText",
      tags: "MyText",
      private: false
    ))
  end

  it "renders new note form" do
    render

    assert_select "form[action=?][method=?]", notes_path, "post" do

      assert_select "textarea#note_content[name=?]", "note[content]"

      assert_select "textarea#note_slug[name=?]", "note[slug]"

      assert_select "textarea#note_in_reply_to[name=?]", "note[in_reply_to]"

      assert_select "textarea#note_tags[name=?]", "note[tags]"

      assert_select "input#note_private[name=?]", "note[private]"
    end
  end
end
