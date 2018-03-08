class CreateGameTeams < ActiveRecord::Migration
  def change
    create_table :game_teams do |t|
      t.integer :score
      t.integer :game_id
      t.integer :team_id

      t.timestamps
    end

    add_index :game_teams, :game_id
    add_index :game_teams, :team_id
  end
end
