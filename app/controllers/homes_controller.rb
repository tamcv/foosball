class HomesController < ApplicationController
  def index
    @result = Team.all.map{ |team| [team.id.to_s, 0] }.to_h
    Match.all.each { |match|
      match.games.each do |game|
        winning_team_id = game.winning_team_id.to_s

        @result[winning_team_id] = @result[winning_team_id] + 1
      end
    }
    @result = @result.sort_by(&:last).reverse.to_h
  end
end
