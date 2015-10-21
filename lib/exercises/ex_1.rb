require_relative 'utils/utils'

module Euler
  extend self

  def ex_1
    problem = 'Find the sum of all the multiples of 3 or 5 below 1000'
    answer = [*1..999].select{|n| n % 3 == 0 || n % 5 == 0 }.inject(:+)
    [problem, answer]
  end

  def ex_2

  end
end
