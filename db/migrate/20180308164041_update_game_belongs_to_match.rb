class UpdateGameBelongsToMatch < ActiveRecord::Migration
  def change
    add_reference :games, :match, index: true
  end
end
