module ComposeEverything
  # Module that when included will add many functional methods to the class
  # if it implements #[]
  module FunctionalGoodies
    require 'composeeverything/refinements'

    def compose(with)
      ->(x) { with[self[x]] }
    end

    def f_map(func)
      compose(func)
    end

    def f_flat_map(func)
      ComposeEverything::Refinements.make ->(this, x) { this[x].f_map(func) }, self
    end

    def f_filter(func)
      ComposeEverything::Refinements.make ->(this) {
        this.filter_indexed ->(_idx, x) { func[x] }
      }, self
    end

    def filter_indexed(func)
      lambda do |x|
        a = self[x]
        func[x, a] ? a : nil
      end
    end

    def f_add(idx, output)
      ComposeEverything::Refinements.make ->(this) {
        this.union ->(x) { output if x == idx }
      }, self
    end

    def intersect(with)
      ComposeEverything::Refinements.make ->(this) {
        this.filter_indexed ->(idx, x) { x == with[idx] }
      }, self
    end

    def union(with)
      ComposeEverything::Refinements.make ->(this, x) {
        a = this.f_get x
        a.nil? ? with[x] : a
      }, self
    end

    def f_delete(a)
      ComposeEverything::Refinements.make ->(this) {
        this.remove ->(_x) { a }
      }, self
    end

    def remove(removed)
      ComposeEverything::Refinements.make ->(this) {
        this.filter_indexed ->(idx, x) { removed[idx] != x }
      }, self
    end

    def f_get(x)
      self[x]
    rescue StandardError
      nil
    end
  end
end
