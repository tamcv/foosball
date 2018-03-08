class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to matches_path
    else
      render 'new'
    end
  end

  def show
    @match = Match.find(params[:id])
  end

  def edit
    @match = Match.find(params[:id])
  end

  def index
    @matches = Match.all.order("created_at DESC")
  end

  def destroy
    Match.find(params[:id]).destroy
    redirect_to matches_path
  end

  private

  def match_params
  end
end
