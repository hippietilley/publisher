require 'rails_helper'

RSpec.describe NotesController, type: :controller do

  # # This should return the minimal set of attributes required to create a valid
  # # Note. As you add validations to Note, be sure to
  # # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  #
  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # NotesController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "assigns all notes as @posts" do
  #     post = Note.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:posts)).to eq([post])
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "assigns the requested note as @post" do
  #     post = Note.create! valid_attributes
  #     get :show, {id: post.to_param}, valid_session
  #     expect(assigns(:post)).to eq(post)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "assigns a new note as @post" do
  #     get :new, {}, valid_session
  #     expect(assigns(:post)).to be_a_new(Note)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested note as @post" do
  #     post = Note.create! valid_attributes
  #     get :edit, {id: post.to_param}, valid_session
  #     expect(assigns(:post)).to eq(post)
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Note" do
  #       expect {
  #         post :create, {note: valid_attributes}, valid_session
  #       }.to change(Note, :count).by(1)
  #     end
  #
  #     it "assigns a newly created note as @post" do
  #       post :create, {note: valid_attributes}, valid_session
  #       expect(assigns(:post)).to be_a(Note)
  #       expect(assigns(:post)).to be_persisted
  #     end
  #
  #     it "redirects to the created note" do
  #       post :create, {note: valid_attributes}, valid_session
  #       expect(response).to redirect_to(Note.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved note as @post" do
  #       post :create, {note: invalid_attributes}, valid_session
  #       expect(assigns(:post)).to be_a_new(Note)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       post :create, {note: invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested note" do
  #       post = Note.create! valid_attributes
  #       put :update, {id: post.to_param, note: new_attributes}, valid_session
  #       post.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested note as @post" do
  #       post = Note.create! valid_attributes
  #       put :update, {id: post.to_param, note: valid_attributes}, valid_session
  #       expect(assigns(:post)).to eq(post)
  #     end
  #
  #     it "redirects to the note" do
  #       post = Note.create! valid_attributes
  #       put :update, {id: post.to_param, note: valid_attributes}, valid_session
  #       expect(response).to redirect_to(note)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the note as @post" do
  #       post = Note.create! valid_attributes
  #       put :update, {id: post.to_param, note: invalid_attributes}, valid_session
  #       expect(assigns(:post)).to eq(post)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       post = Note.create! valid_attributes
  #       put :update, {id: post.to_param, note: invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested note" do
  #     post = Note.create! valid_attributes
  #     expect {
  #       delete :destroy, {id: post.to_param}, valid_session
  #     }.to change(Note, :count).by(-1)
  #   end
  #
  #   it "redirects to the notes list" do
  #     post = Note.create! valid_attributes
  #     delete :destroy, {id: post.to_param}, valid_session
  #     expect(response).to redirect_to(notes_url)
  #   end
  # end

end
