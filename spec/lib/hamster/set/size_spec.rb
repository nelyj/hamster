require "spec_helper"
require "hamster/set"

describe Hamster::Set do
  [:size, :length].each do |method|
    describe "##{method}" do
      [
        [[], 0],
        [["A"], 1],
        [%w[A B C], 3],
      ].each do |values, result|
        it "returns #{result} for #{values.inspect}" do
          expect(S[*values].send(method)).to eq(result)
        end
      end
    end
  end
end