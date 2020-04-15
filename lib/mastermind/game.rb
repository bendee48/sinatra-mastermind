class Game
  attr_reader :code
  COLORS = %w[red green yellow cyan magenta black]
  
  def initialize
    @code = set_code
  end

  def set_code
    COLORS.sample(4)
  end
end