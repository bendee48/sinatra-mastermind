# frozen_string_literal: true

require_relative './feedback'

# Class to hold a color combination
class Combination
  attr_reader :colours

  def initialize(colours)
    @colours = colours
  end

  def equal?(other)
    return false unless other.is_a?(Combination)

    colours == other.colours
  end

  def compare(combination)
    feedback = []
    used = []

    colours.each_with_index do |colour, index|
      if colour == combination.colours[index]
        feedback << 'black'
      else
        combination.colours.each_with_index do |combo_colour, idx|
          if colour == combo_colour && (combo_colour != colours[idx] && !used.include?(combo_colour))
            feedback << 'white'
            used << combo_colour
          end
        end
      end
    end
    Feedback.new(colours, feedback)
  end
end
