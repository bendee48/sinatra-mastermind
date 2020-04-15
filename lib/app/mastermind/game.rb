class Game
  attr_accessor :board, :code, :duplicates
  COLORS = %w[red green yellow cyan magenta black]
  
  def initialize
    @code = set_code
    @duplicates = false
  end

  def set_code
    COLORS.sample(4)
  end
end