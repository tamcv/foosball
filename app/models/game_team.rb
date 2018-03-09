class GameTeam < ActiveRecord::Base
  validates :game_id, presence: true
  validates :team_id, presence: true
  validates :score, presence: true, inclusion: [8, 9, 10]

  belongs_to :game
  belongs_to :team
end
