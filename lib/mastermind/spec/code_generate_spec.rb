require_relative '../code_generate.rb'

describe CodeGenerate do
  describe "CodeGenerate.generate" do
    it "returns a combination" do
      expect(CodeGenerate.generate).to be_a Combination
    end

    it "generates a different combination each (99.9% of the) time" do
      combo1 = CodeGenerate.generate
      combo2 = CodeGenerate.generate
      expect(combo1.is_equal?(combo2)).to eql false
    end
  end
end