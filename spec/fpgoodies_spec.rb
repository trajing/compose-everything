require 'spec_helper'
require 'linked_list'

using ComposeEverything::Hash
using ComposeEverything::Proc

describe ComposeEverything::FunctionalGoodies do
  context "When implemented on a custom class" do
    a = LinkedList.from_arr([1, 2, 3])
    b = LinkedList.from_arr(["", "hi", "hello", "meow"])
    hashmap = {:hello => 4, :meow => 5}

    it "Implements compose" do
      c = a.compose(b)
      expect(c[0]).to eq "hi"
      expect(c[1]).to eq "hello"
      expect(c[2]).to eq "meow"
    end

    it "Unions" do
      c = a.union hashmap
      expect(c[0]).to eq 1
      expect(c[1]).to eq 2
      expect(c[2]).to eq 3
      expect(c[:hello]).to eq 4
      expect(c[:meow]).to eq 5
      expect(c[90]).to eq nil
    end
  end

  context "Refinements" do
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

    it "Composes" do
        d = a.compose(b).compose(c)
        expect(d[0]).to eq "life"
        expect(d[1]).to eq "world"
        expect(d[2]).to eq "striking"
    end
  end
end
