class AddLocationIdToGameSessions < ActiveRecord::Migration
  def self.up
    add_column :game_sessions, :location_id, :integer
  end

  def self.down
    remove_column :game_sessions, :location_id
  end
end
