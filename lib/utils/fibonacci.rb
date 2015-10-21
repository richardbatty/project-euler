module Fibonacci
  extend self

  def stop_before(max)
    enum.take_while {|n| n < max}
  end

  def enum
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
