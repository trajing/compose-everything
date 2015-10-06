require 'spec_helper'
require 'linked_list'

using ComposeEverything::Hash
using ComposeEverything::Proc

describe ComposeEverything::FunctionalGoodies do
  context "When implemented on a custom class" do
    a = LinkedList.from_arr([1, 2, 3])
    b = LinkedList.from_arr([1, "hi", "hello", "meow"])
    hashmap = {:hello => 4, :meow => 5}

    it "Implements compose" do
      c = a.compose(b)
      expect(c[0]).to eq "hi"
      expect(c[1]).to eq "hello"
      expect(c[2]).to eq "meow"
    end

    it "Unions" do
      c = a.union hashmap
      d = hashmap.union a

      def test_unions(x)
        expect(x[0]).to eq 1
        expect(x[1]).to eq 2
        expect(x[2]).to eq 3
        expect(x[:hello]).to eq 4
        expect(x[:meow]).to eq 5
        expect(x[90]).to eq nil
      end

      test_unions c
      test_unions d
    end

    it "Intersects" do
      c = a.intersect b

      expect(c[0]).to eq 1
      expect(c[1]).to eq nil
    end

    it "Maps" do
      c = a.f_map ->(x) { x * x }
      expect(c[0]).to eq 1
      expect(c[1]).to eq 4
      expect(c[2]).to eq 9
    end

    it "Filters" do
      c = a.f_filter ->(x) { x.odd? }
      expect(c[0]).to eq 1
      expect(c[1]).to eq nil
      expect(c[2]).to eq 3
    end

    it "Removes" do
      c = a.remove b
      expect(c[0]).to eq nil
      expect(c[1]).to eq 2
      expect(c[2]).to eq 3
    end

    it "Deletes" do
      c = a.f_delete 2
      expect(c[0]).to eq 1
      expect(c[1]).to eq nil
      expect(c[2]).to eq 3
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
