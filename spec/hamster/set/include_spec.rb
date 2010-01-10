require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

require 'hamster/set'

describe Hamster::Set do

  [:include?, :member?, :contains?, :elem?].each do |method|

    describe "##{method}" do

      before do
        @set = Hamster.set("A", "B", "C", nil)
      end

      ["A", "B", "C", nil].each do |value|

        it "returns true for an existing value (#{value.inspect})" do
          @set.send(method, value).should == true
        end

      end

      it "returns false for a non-existing value" do
        @set.send(method, "D").should == false
      end

    end

  end

end
