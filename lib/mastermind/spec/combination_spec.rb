require_relative '../combination'
require_relative '../game'

describe Combination do
  let(:combo1) { Combination.new(['green', 'magenta', 'black', 'yellow']) }
  let(:combo2) { Combination.new(['red', 'cyan', 'black', 'magenta']) }
  let(:code) { Combination.new(['red', 'cyan', 'black', 'magenta']) }

  describe "#compare" do
    it "returns a Feedback object" do
      expect(combo1.compare(code)).to be_a Feedback
    end
  end

  describe "#is_equal?" do
    context "combinations are equal" do
      it "returns true" do
        expect(combo2.is_equal?(code)).to eql true
      end
    end

    context "combinations aren't equal" do
      it "returns false" do
        expect(combo1.is_equal?(code)).to eql false
      end
    end
  end
end