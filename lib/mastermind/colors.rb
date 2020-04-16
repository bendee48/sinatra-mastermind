class Colors
  attr_reader :selected

  def initialize
    @selected = []
  end

  def add_colors(colors)
    selected << colors
  end
end