class Player
  attr_reader :name
  attr_accessor :health

  def initialize(name)
    @name = name
    @health = 3
  end

  def deduct_point
    @health -= 1
  end

  def reset_health
    @health = 3
  end
end
