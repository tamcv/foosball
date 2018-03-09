class Match < ActiveRecord::Base
  has_many :match_teams, dependent: :delete_all
  has_many :games, dependent: :delete_all

  def team_ids
    match_teams.pluck(:team_id)
  end
end
