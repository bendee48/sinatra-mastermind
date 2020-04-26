# frozen_string_literal: true

# Class to hold guess with feedback
class Feedback
  attr_accessor :guess, :result

  def initialize(guess, result)
    @guess = guess
    @result = result
  end
end
