class Game < ActiveRecord::Base
  validates :number, presence: true, inclusion: [1, 2, 3]

  has_many :game_teams, dependent: :delete_all
  has_many :teams, through: :game_teams

  accepts_nested_attributes_for :game_teams

  def winning_team_id
    if game_teams.first.score > game_teams.last.score
      game_teams.first.team_id
    else
      game_teams.last.team_id
    end
  end
end
