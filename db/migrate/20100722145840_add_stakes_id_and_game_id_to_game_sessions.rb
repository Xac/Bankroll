class AddStakesIdAndGameIdToGameSessions < ActiveRecord::Migration
  def self.up
    add_column :game_sessions, :stake_id, :integer
    add_column :game_sessions, :game_id, :integer
  end

  def self.down
    remove_column :game_sessions, :game_id
    remove_column :game_sessions, :stake_id
  end
end
