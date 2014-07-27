require "spec_helper"
require "hamster/list"

describe Hamster::List do
  describe "#<=>" do
    [
      [[], [1]],
      [[1], [2]],
      [[1], [1, 2]],
      [[2, 3, 4], [3, 4, 5]]
    ].each do |items1, items2|

      describe "with #{items1} and #{items2}" do
        it "returns -1" do
          (Hamster.list(*items1) <=> Hamster.list(*items2)).should be(-1)
        end
      end

      describe "with #{items2} and #{items1}" do
        it "returns 1" do
          (Hamster.list(*items2) <=> Hamster.list(*items1)).should be(1)
        end
      end

      describe "with #{items1} and #{items1}" do
        it "returns 0" do
          (Hamster.list(*items1) <=> Hamster.list(*items1)).should be(0)
        end
      end
    end
  end
end