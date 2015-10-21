module Utils
  extend self

  class Fibonacci
    include Enumerable

    def initialize
      @a = 0
    end

    def each
      5.times do |i|
        yield i
      end
    end
  end
  def fibonacci(n)
    if n == 1
      1
    elsif n == 2
      2
    else
      fibonacci(n - 2) + fibonacci(n - 1)
    end
  end
end
