# Load stakes
stakes  = [
  [0.10, 0.25],
  [0.25, 0.50],
  [0.50, 1],
  [2, 5],
  [3, 6],
  [5, 10],
  [25, 50],
  [100, 200],
  [400, 800],
  [1000, 2000],
  [4000, 8000],
  [16000,32000]
]

stakes.each do |stake|
  Stake.create({:low => stake[0], :high => stake[1]})
end

games = [
  "Omaha - Pot limit",
  "Omaha - 8 or better",
  "Texas Hold 'Em - Limit",
  "Texas Hold 'Em - No Limit"
]

games.each do |game|
  Game.create(:name => game)
end