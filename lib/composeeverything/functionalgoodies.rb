module ComposeEverything::FunctionalGoodies
  def compose(with)
    ->(x) { with[self[x]] }
  end

  def f_map(func)
    compose(func)
  end

  def f_flat_map(func)
    ->(x) {
      self[x].f_map(func)
    }
  end

  def f_filter(func)
    filter_indexed ->(idx, x) {
      func[x]
    }
  end

  def filter_indexed(func)
    ->(x) {
      a = self[x]
      func[x, a] ? a : nil
    }
  end

  def f_add(idx, output)
    union ->(x) {
      output if x == idx
    }
  end

  def intersection(with)
    filter_indexed ->(idx, x) {
      x == with[idx]
    }
  end

  def union(with)
    ->(x) {
      begin
        a = self[x]
        a.nil? ? with[x] : a
      rescue Exception
        begin
          with[x]
        rescue
          nil
        end
      end
    }
  end

  def f_delete(a)
    remove ->(x) {
      a
    }
  end

  def remove(removed)
    filter_indexed ->(idx, x) {
      removed[idx] != x
    }
  end
end
