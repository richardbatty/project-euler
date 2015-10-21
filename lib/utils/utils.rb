module Utils
  extend self

  def less_than_n_of_fib(max)
    fib.take_while {|n| n < max}
  end

  def fib
    Enumerator.new do |yielder|
      previous = [0, 1]
      loop do
        current = previous.reduce(:+)
        yielder.yield current
        previous = [previous[1], current]
      end
    end
  end
end
