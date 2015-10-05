require 'spec_helper'

describe ComposeEverything::FunctionalGoodies do
  context "When implemented on a custom class" do
    class LinkedList
      include ComposeEverything::FunctionalGoodies

      attr_reader :head, :rest

      def initialize(head, rest)
        @head = head
        @rest = rest
      end

      def [](x)
        if x < 0
          raise "Index out of bounds on LinkedList"
        elsif x == 0
          @head
        else
          @rest[x - 1]
        end
      end

      class << self
        def empty
          LinkedList.new(nil, nil)
        end

        def from_arr(arr)
          if arr.empty?
            LinkedList.empty
          else
            LinkedList.new(arr.first, arr.drop(1))
          end
        end
      end
    end

    it "Implements compose" do
      a = LinkedList.from_arr([1, 2, 3])
      b = LinkedList.from_arr(["", "hi", "hello", "meow"])
      expect(a.compose(b)[0]).to eq "hi"
      expect(a.compose(b)[1]).to eq "hello"
      expect(a.compose(b)[2]).to eq "meow"
    end
  end
end
