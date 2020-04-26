# frozen_string_literal: true

require_relative '../combination'
require_relative '../game'

describe Combination do
  let(:combo1) { Combination.new(%w[green magenta black yellow]) }
  let(:combo2) { Combination.new(%w[red cyan black magenta]) }
  let(:code) { Combination.new(%w[red cyan black magenta]) }

  describe '#equal?' do
    context 'combinations are equal' do
      it 'returns true' do
        expect(combo2.equal?(code)).to eql true
      end
    end

    context "combinations aren't equal" do
      it 'returns false' do
        expect(combo1.equal?(code)).to eql false
      end
    end
  end

  describe '#compare' do
    it 'returns a Feedback object' do
      expect(combo1.compare(code)).to be_a Feedback
    end

    context 'feedback' do
      describe 'detects correct colours in code' do
        it 'returns 2 white pegs' do
          guess = Combination.new(%w[magenta red green yellow])
          feedback = guess.compare(code).result
          expect(feedback).to eql %w[white white]
        end

        it 'returns 4 white pegs' do
          guess = Combination.new(%w[black magenta red cyan])
          feedback = guess.compare(code).result
          expect(feedback).to eql %w[white white white white]
        end
      end

      describe 'detects correct colours in correct positions' do
        it 'returns 1 black peg' do
          guess = Combination.new(%w[red green red yellow])
          feedback = guess.compare(code).result
          expect(feedback).to eql ['black']
        end

        it 'returns 3 black pegs' do
          guess = Combination.new(%w[red cyan black yellow])
          feedback = guess.compare(code).result
          expect(feedback).to eql %w[black black black]
        end
      end

      describe 'detects correct colours and positions' do
        it 'returns 1 black and 1 white peg' do
          guess = Combination.new(%w[red green magenta yellow])
          feedback = guess.compare(code).result
          expect(feedback).to eql %w[black white]
        end

        it 'returns 2 black and 2 white pegs' do
          guess = Combination.new(%w[red cyan magenta black])
          feedback = guess.compare(code).result
          expect(feedback).to eql %w[black black white white]
        end
      end
    end
  end
end
