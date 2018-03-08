class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    ActiveRecord::Base.transaction do
      begin
        @match = Match.create(match_params)
        @match.match_teams.create(match_team_params)
      rescue
      end
      redirect_to matches_path
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

  def match_team_params
    params.require(:match).permit(match_teams: [:team_id])[:match_teams]
  end
end
