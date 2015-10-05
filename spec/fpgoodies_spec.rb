require 'spec_helper'
require 'linked_list'

using ComposeEverything::Hash
using ComposeEverything::Proc

describe ComposeEverything::FunctionalGoodies do
  context "When implemented on a custom class" do
    it "Implements compose" do
      a = LinkedList.from_arr([1, 2, 3])
      b = LinkedList.from_arr(["", "hi", "hello", "meow"])
      c = a.compose(b)
      expect(c[0]).to eq "hi"
      expect(c[1]).to eq "hello"
      expect(c[2]).to eq "meow"
    end
  end

  context "Refinements" do
    it "Composes" do
        a = LinkedList.from_arr(["hi", "hello", "meow"])
        b = ->(x) {
          if x == "hi"
            1
          elsif x == "hello"
            2
          else
            3
          end
        }
        c = {1 => "life", 2 => "world", 3 => "striking"}
        d = a.compose(b).compose(c)
        expect(d[0]).to eq "life"
        expect(d[1]).to eq "world"
        expect(d[2]).to eq "striking"
    end
  end
end
