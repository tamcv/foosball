require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST create" do
    it "creates user successfully" do
      params =  {user: {first_name: "First", last_name: "Last"}}

      expect {
        post :create, params
      }.to change(User, :count).by(1)
      user = User.first

      expect(user.first_name).to eq("First")
      expect(user.last_name).to eq("Last")
    end
  end

  describe "PUT update" do
    let(:user) {create(:user)}

    it "updates first name successfully" do
      params =  {user: {first_name: "New First"}, id: user.id}

      put :update, params

      expect(user.reload.first_name).to eq("New First")
    end
  end

  describe "DELETE destroy" do
    let(:user) {create(:user)}

    it "destroys user successfully" do
      params =  {id: user.id}

      delete :destroy, params

      expect(User.count).to eq(0)
    end
  end
end
