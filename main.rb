require './players'
require './turns'

def log(player1, player2)
  puts "#{player1.name}: #{player1.health}/3 vs #{player2.name}: #{player2.health}/3"
end

puts 'Please enter name for player 1:'
name1 = gets.strip
puts 'Please enter name for player 2:'
name2 = gets.strip

player1 = Player.new(name1)
player2 = Player.new(name2)
turns = Turns.new
turn_counter = true

while player1.health > 0 && player2.health > 0 do
  if turn_counter
    turns.one_turn(player1)
  else
    turns.one_turn(player2)
  end
  log(player1, player2)
  turn_counter = !turn_counter
end
if player1.health == 0
  winner = player2
else
  winner = player1
end
puts "#{winner.name} WINS with a score of #{winner.health}/3!"
puts "---GAME OVER---"
puts "Good bye!"
