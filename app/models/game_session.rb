class GameSession < ActiveRecord::Base
  belongs_to :location
  belongs_to :game
  belongs_to :stake
    
  def self.bankroll_on(date)
    GameSession.where(["started_at < ?",date.end_of_day]).sum('cash_out-buyin')
  end
  
  def self.profits_by_game
    GameSession.group('game_id').select('game_id, sum(cash_out) as cash_out, sum(buyin) as buyin')
  end
  
  def net_gain
    cash_out - buyin
  end
  
  def hours_played
    (((ended_at - started_at)/60)/60).round(2)
  end
  
  def hourly_rate
    net_gain / hours_played
  end
end
