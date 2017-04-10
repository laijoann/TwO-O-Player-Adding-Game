class Turns
  def one_turn(player)
    puts "---NEW TURN---"
    question = generate_questions(player)
    input = gets.strip
      if input != question.to_s
        player.deduct_point
        puts "Yikes!"
      else
        puts "Yay!"
      end
  end

  def generate_questions(player)
    r1 = Random.rand(1...99)
    r2 = Random.rand(1...99)
    puts "#{player.name}: What does #{r1} plus #{r2} equal?"
    r1 + r2
  end
end
