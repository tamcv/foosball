class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :number

      t.timestamps
    end
  end
end
