require_relative '../game.rb'

describe Game do
  let(:game) { Game.new }

  describe "#code_generate" do
    context "on initialize" do
      it "sets code" do
        expect(game.code).to be_a Combination
      end
    end
  end

  describe "#create_feedback" do
    context "feedbacks" do
      it "adds feedback to feedbacks" do
        guess = ['red', 'red', 'red', 'red']
        3.times { game.create_feedback(guess) }
        expect(game.feedbacks.all? { |x| x.is_a?(Feedback) }).to eql true
      end
    end

    context "game win" do
      it "detects game win" do
        allow(game).to receive(:code) { Combination.new(['red', 'green', 'yellow', 'magenta']) }
        game.create_feedback(['red', 'green', 'yellow', 'magenta'])
        expect(game.win).to eql true
      end
    end

    context "game loss" do
      it "detects game loss" do
        game.turns = 11
        allow(game).to receive(:code) { Combination.new(['red', 'green', 'yellow', 'magenta']) }
        game.create_feedback(['red', 'red', 'red', 'red'])
        expect(game.game_over).to eql true
      end
    end
  end
end