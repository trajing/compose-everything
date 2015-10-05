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
