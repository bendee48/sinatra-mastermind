require_relative './combination'

class CodeGenerate
  COLOURS = %w[red black cyan magenta green yellow]

  def self.generate 
    Combination.new(COLOURS.sample(4))
  end
end