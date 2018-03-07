require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "POST create" do
    it "creates game successfully" do
      params =  {game: {number: 1}}

      expect {
        post :create, params
      }.to change(Game, :count).by(1)
      game = Game.first

      expect(game.number).to eq(1)
    end
  end

  describe "PUT update" do
    let(:game) {create(:game, number: 1)}

    it "updates first name successfully" do
      params =  {game: {number: 2}, id: game.id}

      put :update, params

      expect(game.reload.number).to eq(2)
    end
  end

  describe "DELETE destroy" do
    let(:game) {create(:game)}

    it "destroys game successfully" do
      params =  {id: game.id}

      delete :destroy, params

      expect(Game.count).to eq(0)
    end
  end
end
