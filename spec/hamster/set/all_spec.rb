require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Hamster::Set do

  describe "#all?" do

    describe "with a block" do

      before do
        @set = Hamster::Set["A", "B", "C", nil]
      end

      it "returns true if the block always returns true" do
        @set.all? { |item| true }.should be_true
      end

      ["A", "B", "C", nil].each do |value|

        it "returns false if the block ever returns false (#{value.inspect})" do
          @set.all? { |item| item == "D" }.should be_false
        end

      end

    end

    describe "with no block" do

      [nil, false].each do |value|

        it "returns true if all values are non-#{value.inspect}" do
          Hamster::Set[!value, !value].all?.should be_true
        end

        it "returns false if any value is #{value.inspect}" do
          Hamster::Set[value, true, "A"].all?.should be_false
        end

      end

    end

  end

end