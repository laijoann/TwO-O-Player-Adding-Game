require './players'
require './turns'

class Main
  attr_accessor :player1, :player2

  def initialize(name1, name2)
    @player1 = Player.new(name1)
    @player2 = Player.new(name2)
  end

  def turn_tracking
    turns = Turns.new
    turn_counter = true
    while @player1.health > 0 && @player2.health > 0 do
      if turn_counter
        turns.one_turn(@player1)
      else
        turns.one_turn(@player2)
      end
      log(@player1, @player2)
      turn_counter = !turn_counter
    end
    game_over
  end

  def game_over
    if @player1.health == 0
      winner = @player2
    else
      winner = @player1
    end
    puts "#{winner.name} WINS with a score of #{winner.health}/3!"
    puts "---GAME OVER---"
  end

  def log(player1, player2)
    puts "#{@player1.name}: #{@player1.health}/3 vs #{@player2.name}: #{@player2.health}/3"
  end

  def game_restart
    @player1.reset_health
    @player2.reset_health
  end
end

#initializes game
puts 'Please enter name for player 1:'
name1 = gets.strip
puts 'Please enter name for player 2:'
name2 = gets.strip
new_game = Main.new(name1, name2)
play_again_input = "Y"
while play_again_input == "Y" do
  new_game.game_restart
  new_game.turn_tracking
  puts 'Play again? (Y/N)'
  play_again_input = gets.strip
end
puts "GOOD BYE :)"
