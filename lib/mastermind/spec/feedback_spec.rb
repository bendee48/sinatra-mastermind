require_relative '../feedback'

describe Feedback do
  describe 'Feedback.result' do
    let(:code) { ['red', 'black', 'cyan', 'magenta'] }

    context "2 colours guessed right" do
      it "returns 2 white pegs" do
        guess = ['yellow', 'cyan', 'black', 'green']
        result = Feedback.result(code, guess)
        expect(result).to eql ['white', 'white']
      end

      it "returns 2 black pegs" do
        guess = ['red', 'black', 'yellow', 'green']
        result = Feedback.result(code, guess)
        expect(result).to eql ['black', 'black']
      end
    end
  end
end