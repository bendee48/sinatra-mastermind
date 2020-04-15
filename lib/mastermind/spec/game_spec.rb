require_relative '../game.rb'

describe Game do
  describe "On initialize" do
    it "sets code" do
      game = Game.new
      expect(game.code).to be_a Array
    end
  end
end