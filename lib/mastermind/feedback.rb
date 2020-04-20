class Feedback
  attr_accessor :colors, :feedback
  @@all = []

  def initialize(colors, feedback)
    @colors = colors
    @feedback = feedback
    @@all.unshift(self)
  end

  def self.all
    @@all
  end

  def self.result(code, guess)
    feedback = []
    used = []

    guess.each_with_index do |guess_color, index|
      if guess_color == code[index]
        feedback << 'black'
      else
        code.each_with_index do |code_color, index|
          if code_color == guess_color && (code_color != guess[index] && !used.include?(code_color))
            feedback << 'white'
            used << code_color
          end
        end
      end
    end
    feedback
  end
end