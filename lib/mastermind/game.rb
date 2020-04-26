# frozen_string_literal: true

require_relative './combination'
require_relative './code_generate'

# Class to hold game state
class Game
  attr_reader :code
  attr_accessor :feedbacks, :win, :turns, :game_over

  def initialize
    @code = CodeGenerate.generate
    @feedbacks = []
    @turns = 0
    @win = false
    @game_over = false
  end

  def create_feedback(guess)
    self.turns += 1
    guess = Combination.new(guess)
    self.win = true if guess.equal?(code)
    self.game_over = true if turns > 11
    feedback = guess.compare(code)
    feedbacks << feedback
  end
end
