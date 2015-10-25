require 'utils/fibonacci'
require 'utils/factors'
require 'utils/primes'

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

  def ex_4
    problem = <<-eos
      Find the largest palindrome made from the product of two 3-digit numbers.
    eos
    products = [*100..999].repeated_combination(2).map do |a, b|
      a * b
    end

    answer = products.sort.reverse.detect do |n|
      n.to_s == n.to_s.reverse
    end
    [problem, answer]
  end

  def ex_5
    problem = <<-eos
      What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
    eos
    # We know 2520 can be divided evenly by 1..10
    # so we just go up in steps of 2520 and check the divisors
    # 11..20
    divisors = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    answer = (2520..Float::INFINITY)
      .step(2520)
      .lazy.
      detect do |n|
        divisors.all? {|divisor| n % divisor == 0}
      end.to_i

    [problem, answer]
  end
  def ex_6
    problem = <<-eos
      Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
    eos
    sum_of_squares = [*1..100].map{|n| n ** 2}.reduce(&:+)
    square_of_sum = [*1..100].reduce(&:+) ** 2
    answer = square_of_sum - sum_of_squares

    [problem, answer]
  end

  def ex_7
    problem = <<-eos
      What is the 10 001st prime number?
    eos
    answer = Primes.nth(10001)

    [problem, answer]
  end

end
