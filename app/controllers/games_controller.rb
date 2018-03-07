class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
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
    params.require(:game).permit(:number)
  end
end