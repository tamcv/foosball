class GamesController < ApplicationController

  def new
    @game = Game.new
    @game.game_teams.build
  end

  def create
    ActiveRecord::Base.transaction do
      begin
        @game = Game.new(game_params)
        @game.save
        @game.game_teams.create(game_team_params)

      rescue
      end
      redirect_to matches_path
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
    @game.game_teams.build
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def index
    @games = Game.all
  end

  def destroy
    Game.find(params[:id]).destroy
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:number, :match_id)
  end

  def game_team_params
    params.require(:game).permit(game_teams: [:team_id, :game_id, :score])[:game_teams]
  end
end
