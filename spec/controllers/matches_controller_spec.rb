require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  describe "POST create" do
    it "creates match successfully" do
      params =  {match: {first_name: "First", last_name: "Last"}}

      expect {
        post :create, params
      }.to change(Match, :count).by(1)

      expect(Match.count).to eq(1)
    end
  end

  describe "DELETE destroy" do
    let(:match) {create(:match)}

    it "destroys match successfully" do
      params =  {id: match.id}

      delete :destroy, params

      expect(Match.count).to eq(0)
    end
  end
end
