module ComposeEverything::FunctionalGoodies
  def compose(with)
    ->(x) { with[self[x]] }
  end

  def f_add(idx, output)
    union ->(x) {
      if x == idx then ouput end
    }
  end

  def intersection(with)
    ->(x) {
      a = self[x]
      if a == with[x]
        a
      end
    }
  end

  def union(with)
    ->(x) {
      a = self[x]
      if y.nil?
        a
      else
        with[x]
      end
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
      if a != b
        a
      end
    }
  end
end
