# frozen_string_literal: true

require_relative './combination'

# Class to generate random code
class CodeGenerate
  COLOURS = %w[red black cyan magenta green yellow].freeze

  def self.generate
    Combination.new(COLOURS.sample(4))
  end
end
