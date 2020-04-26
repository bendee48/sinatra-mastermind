require_relative './combination'

class Game
  attr_reader :code
  attr_accessor :feedbacks, :win, :turns, :game_over

  def initialize
    @code = code_generate
    @feedbacks = []
    @turns = 0
    @win = false
    @game_over = false
  end

  def code_generate
    Combination.new(['red', 'cyan', 'black', 'magenta'])
  end

  def create_feedback(guess)
    self.turns += 1
    guess = Combination.new(guess)
    self.win = true if guess.is_equal?(code)
    self.game_over = true if turns > 11
    feedback = guess.compare(code)
    feedbacks << feedback
  end
end