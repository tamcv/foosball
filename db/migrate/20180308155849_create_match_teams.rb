class CreateMatchTeams < ActiveRecord::Migration
  def change
    create_table :match_teams do |t|
      t.integer :match_id
      t.integer :team_id

      t.timestamps
    end
    add_index :match_teams, :match_id
    add_index :match_teams, :team_id
  end
end
