task(:load_demo_data => :environment) do
  puts "Loading demo data..."
  
  bi_multiplier = 1.upto(60).map{|m| m/10.0}.to_a

  ['Palms','Rio','The Commerce','Harrah\'s'].each do |loc|
    Location.create :name => loc
  end
  
  # Generate 2 years worth of progressive data  
  730.times do |time|
    # skip one day per week, on average
    next if 1.upto(7).to_a.sample == 4
    
    date = (730-time).days.ago.beginning_of_day

    # Don't play before 6am
    started_at = date + (6+rand(12)).hours

    # No sessions less than an hour or more than 8 hours
    ended_at = started_at + rand(7).hours
    ended_at += rand(59).minutes

    # Get better over time
    time_arr = 1.upto(time+2).to_a
    winning = (time_arr.first(time_arr.length/2) + time_arr.reject{|i| i.odd? }).sample.even?

    stakes = Stake.order('low ASC').first(5).sample
    buy_in = stakes.high * [50,75,100,125,150].sample

    cash_out = buy_in * bi_multiplier.sample
    cash_out = (cash_out * -1) unless winning

    GameSession.create({
      :started_at => started_at,
      :ended_at   => ended_at,
      :stake_id => stakes,
      :game_id => Game.all.sample.id,
      :location_id => Location.all.sample.id,
      :buyin => buy_in,
      :cash_out => cash_out
    })
  end
  puts "Load complete..."
end