module ComposeEverything::FunctionalGoodies
  def compose(with)
    ->(x) { with[self[x]] }
  end

  def f_add(idx, output)
    union ->(x) {
      output if x == idx
    }
  end

  def intersection(with)
    ->(x) {
      a = self[x]
      a == with[x] ? a : nil
    }
  end

  def union(with)
    ->(x) {
      a = self[x]
      y.nil? ? a : with[x]
    }
  end

  def f_delete(a)
    remove ->(x) {
      a
    }
  end

  def remove(removed)
    ->(x) {
      a = self[x]
      b = removed[x]
      a != b ? a : nil
    }
  end
end
