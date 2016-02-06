require 'rails_helper'

RSpec.describe RedirectsController, type: :controller do

  # # This should return the minimal set of attributes required to create a valid
  # # Redirect. As you add validations to Redirect, be sure to
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
  # # RedirectsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "assigns all redirects as @redirects" do
  #     redirect = Redirect.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:redirects)).to eq([redirect])
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "assigns the requested redirect as @redirect" do
  #     redirect = Redirect.create! valid_attributes
  #     get :show, {id: redirect.to_param}, valid_session
  #     expect(assigns(:redirect)).to eq(redirect)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "assigns a new redirect as @redirect" do
  #     get :new, {}, valid_session
  #     expect(assigns(:redirect)).to be_a_new(Redirect)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested redirect as @redirect" do
  #     redirect = Redirect.create! valid_attributes
  #     get :edit, {id: redirect.to_param}, valid_session
  #     expect(assigns(:redirect)).to eq(redirect)
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Redirect" do
  #       expect {
  #         post :create, {redirect: valid_attributes}, valid_session
  #       }.to change(Redirect, :count).by(1)
  #     end
  #
  #     it "assigns a newly created redirect as @redirect" do
  #       post :create, {redirect: valid_attributes}, valid_session
  #       expect(assigns(:redirect)).to be_a(Redirect)
  #       expect(assigns(:redirect)).to be_persisted
  #     end
  #
  #     it "redirects to the created redirect" do
  #       post :create, {redirect: valid_attributes}, valid_session
  #       expect(response).to redirect_to(Redirect.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved redirect as @redirect" do
  #       post :create, {redirect: invalid_attributes}, valid_session
  #       expect(assigns(:redirect)).to be_a_new(Redirect)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       post :create, {redirect: invalid_attributes}, valid_session
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
  #     it "updates the requested redirect" do
  #       redirect = Redirect.create! valid_attributes
  #       put :update, {id: redirect.to_param, redirect: new_attributes}, valid_session
  #       redirect.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested redirect as @redirect" do
  #       redirect = Redirect.create! valid_attributes
  #       put :update, {id: redirect.to_param, redirect: valid_attributes}, valid_session
  #       expect(assigns(:redirect)).to eq(redirect)
  #     end
  #
  #     it "redirects to the redirect" do
  #       redirect = Redirect.create! valid_attributes
  #       put :update, {id: redirect.to_param, redirect: valid_attributes}, valid_session
  #       expect(response).to redirect_to(redirect)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the redirect as @redirect" do
  #       redirect = Redirect.create! valid_attributes
  #       put :update, {id: redirect.to_param, redirect: invalid_attributes}, valid_session
  #       expect(assigns(:redirect)).to eq(redirect)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       redirect = Redirect.create! valid_attributes
  #       put :update, {id: redirect.to_param, redirect: invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested redirect" do
  #     redirect = Redirect.create! valid_attributes
  #     expect {
  #       delete :destroy, {id: redirect.to_param}, valid_session
  #     }.to change(Redirect, :count).by(-1)
  #   end
  #
  #   it "redirects to the redirects list" do
  #     redirect = Redirect.create! valid_attributes
  #     delete :destroy, {id: redirect.to_param}, valid_session
  #     expect(response).to redirect_to(redirects_url)
  #   end
  # end

end
