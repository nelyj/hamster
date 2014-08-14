require "spec_helper"
require "hamster/hash"

describe Hamster::Hash do
  [:find, :detect].each do |method|
    describe "##{method}" do

      [
        [[], "A", nil],
        [[], nil, nil],
        [["A" => "aye"], "A", ["A", "aye"]],
        [["A" => "aye"], "B", nil],
        [["A" => "aye"], nil, nil],
        [["A" => "aye", "B" => "bee", nil => "NIL"], "A", ["A", "aye"]],
        [["A" => "aye", "B" => "bee", nil => "NIL"], "B", ["B", "bee"]],
        [["A" => "aye", "B" => "bee", nil => "NIL"], nil, [nil, "NIL"]],
        [["A" => "aye", "B" => "bee", nil => "NIL"], "C", nil],
      ].each do |values, key, expected|

        describe "on #{values.inspect}" do
          before do
            @hash = Hamster.hash(*values)
          end

          describe "with a block" do
            before do
              @result = @hash.send(method) { |k, v| k == key }
            end

            it "returns #{expected.inspect}" do
              @result.should == expected
            end
          end

          describe "without a block" do
            it "returns an Enumerator" do
              @result = @hash.send(method)
              @result.should be_kind_of(Enumerator)
              @result.each { |k,v| k == key }.should == expected
            end
          end
        end
      end
    end
  end
end