require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do

  # # This should return the minimal set of attributes required to create a valid
  # # Activity. As you add validations to Activity, be sure to
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
  # # ActivitiesController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "assigns all activities as @activities" do
  #     activity = Activity.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:activities)).to eq([activity])
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "assigns the requested activity as @activity" do
  #     activity = Activity.create! valid_attributes
  #     get :show, {:id => activity.to_param}, valid_session
  #     expect(assigns(:activity)).to eq(activity)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "assigns a new activity as @activity" do
  #     get :new, {}, valid_session
  #     expect(assigns(:activity)).to be_a_new(Activity)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested activity as @activity" do
  #     activity = Activity.create! valid_attributes
  #     get :edit, {:id => activity.to_param}, valid_session
  #     expect(assigns(:activity)).to eq(activity)
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Activity" do
  #       expect {
  #         post :create, {:activity => valid_attributes}, valid_session
  #       }.to change(Activity, :count).by(1)
  #     end
  #
  #     it "assigns a newly created activity as @activity" do
  #       post :create, {:activity => valid_attributes}, valid_session
  #       expect(assigns(:activity)).to be_a(Activity)
  #       expect(assigns(:activity)).to be_persisted
  #     end
  #
  #     it "redirects to the created activity" do
  #       post :create, {:activity => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Activity.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved activity as @activity" do
  #       post :create, {:activity => invalid_attributes}, valid_session
  #       expect(assigns(:activity)).to be_a_new(Activity)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       post :create, {:activity => invalid_attributes}, valid_session
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
  #     it "updates the requested activity" do
  #       activity = Activity.create! valid_attributes
  #       put :update, {:id => activity.to_param, :activity => new_attributes}, valid_session
  #       activity.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested activity as @activity" do
  #       activity = Activity.create! valid_attributes
  #       put :update, {:id => activity.to_param, :activity => valid_attributes}, valid_session
  #       expect(assigns(:activity)).to eq(activity)
  #     end
  #
  #     it "redirects to the activity" do
  #       activity = Activity.create! valid_attributes
  #       put :update, {:id => activity.to_param, :activity => valid_attributes}, valid_session
  #       expect(response).to redirect_to(activity)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the activity as @activity" do
  #       activity = Activity.create! valid_attributes
  #       put :update, {:id => activity.to_param, :activity => invalid_attributes}, valid_session
  #       expect(assigns(:activity)).to eq(activity)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       activity = Activity.create! valid_attributes
  #       put :update, {:id => activity.to_param, :activity => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested activity" do
  #     activity = Activity.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => activity.to_param}, valid_session
  #     }.to change(Activity, :count).by(-1)
  #   end
  #
  #   it "redirects to the activities list" do
  #     activity = Activity.create! valid_attributes
  #     delete :destroy, {:id => activity.to_param}, valid_session
  #     expect(response).to redirect_to(activities_url)
  #   end
  # end

end
