class CreateGameSessions < ActiveRecord::Migration
  def self.up
    create_table :game_sessions do |t|
      t.decimal :buyin, :scale => 2, :precision => 10
      t.decimal :cash_out, :scale => 2, :precision => 10
      t.datetime :started_at
      t.datetime :ended_at
            
      t.timestamps
    end
  end

  def self.down
    drop_table :game_sessions
  end
end
