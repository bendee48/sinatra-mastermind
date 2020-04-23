require_relative './combination'

class Game
  attr_reader :code, :turns
  attr_accessor :feedbacks, :win

  def initialize
    @code = code_generate
    @feedbacks = []
    @turns = 0
    @win = false
  end

  def code_generate
    Combination.new(['red', 'cyan', 'black', 'magenta'])
  end

  def create_feedback(guess)
    guess = Combination.new(guess)
    self.win = true if guess.is_equal?(code)
    feedback = guess.compare(code)
    feedbacks << feedback
  end

  def game_over?
    self.turns > 12
  end

  def check_for_win
    
  end
end