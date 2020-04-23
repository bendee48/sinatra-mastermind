require_relative './feedback'

class Combination
  attr_reader :colours

  def initialize(colours)
    @colours = colours
  end

  def is_equal?(combination)
    return false unless combination.is_a?(Combination)
    self.colours == combination.colours
  end

  def compare(combination)
    feedback = []
    used = []

    self.colours.each_with_index do |colour, index|
      if colour == combination.colours[index]
        feedback << 'black'
      else
        combination.colours.each_with_index do |combo_colour, index|
          if colour == combo_colour && (combo_colour != self.colours[index] && !used.include?(combo_colour))
            feedback << 'white'
            used << combo_colour
          end
        end
      end
    end
    Feedback.new(self.colours, feedback)
  end
end