module Fibonacci
  extend self, Enumerable

  def each
    previous = [0, 1]
    loop do
      current = previous.reduce(:+)
      yield current
      previous = [previous[1], current]
    end
  end
end
