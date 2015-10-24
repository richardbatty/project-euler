require 'utils/fibonacci'
require 'utils/factors'

module Euler
  extend self

  def ex_1
    problem = 'Find the sum of all the multiples of 3 or 5 below 1000'
    answer = [*1..999].select{|n| n % 3 == 0 || n % 5 == 0 }.inject(:+)
    [problem, answer]
  end

  def ex_2
    problem = <<-eos
      By considering the terms in the Fibonacci sequence whose values
      do not exceed four million, find the sum of the even-valued terms.
    eos
    answer = Fibonacci.take_while {|n| n < 4000000}
      .select{|x| x.even?}
      .reduce(:+)
    [problem, answer]
  end

  def ex_3
    problem = <<-eos
      What is the largest prime factor of the number 600851475143 ?
    eos
    answer = Factors.largest_prime_factor(600851475143)
    [problem, answer]
  end
end
