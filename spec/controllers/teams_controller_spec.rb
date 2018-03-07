require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  describe "POST create" do
    it "creates team successfully" do
      params =  {team: {name: "Name"}}

      expect {
        post :create, params
      }.to change(Team, :count).by(1)
      team = Team.first

      expect(team.name).to eq("Name")
    end
  end

  describe "PUT update" do
    let(:team) {create(:team)}

    it "updates first name successfully" do
      params =  {team: {name: "New Name"}, id: team.id}

      put :update, params

      expect(team.reload.name).to eq("New Name")
    end
  end

  describe "DELETE destroy" do
    let(:team) {create(:team)}

    it "destroys team successfully" do
      params =  {id: team.id}

      delete :destroy, params

      expect(Team.count).to eq(0)
    end
  end
end
