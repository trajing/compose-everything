# Module that when included will add many functional methods to the class
# if it implements #[]
module ComposeEverything::FunctionalGoodies
  def compose(with)
    ->(x) { with[self[x]] }
  end

  def f_map(func)
    compose(func)
  end

  def f_flat_map(func)
    ->(x) { self[x].f_map(func) }
  end

  def f_filter(func)
    filter_indexed ->(_idx, x) { func[x] }
  end

  def filter_indexed(func)
    lambda do |x|
      a = self[x]
      func[x, a] ? a : nil
    end
  end

  def f_add(idx, output)
    union ->(x) { output if x == idx }
  end

  def intersect(with)
    filter_indexed ->(idx, x) { x == with[idx] }
  end

  def union(with)
    lambda do |x|
      a = f_get x
      a.nil? ? with[x] : a
    end
  end

  def f_delete(a)
    remove ->(_x) { a }
  end

  def remove(removed)
    filter_indexed ->(idx, x) { removed[idx] != x }
  end

  protected def f_get(x)
    begin
      self[x]
    rescue Exception
      nil
    end
  end
end
