require 'utils/fibonacci'
require 'utils/factors'
require 'utils/primes'
require 'utils/string_windows'

module Euler
  extend self

  def exercises_answered
    instance_methods
      .select { |method| /^ex_[0-9]+/ =~ method }
      .map { |method| method[3..-1] }
  end

  def exercise(exercise_no)
    send("ex_#{exercise_no}")
  end

  def ex_1
    problem = <<-eos
      Find the sum of all the multiples of 3 or 5 below 1000
    eos
    answer = [*1..999]
             .select { |n| n % 3 == 0 || n % 5 == 0 }
             .reduce(:+)

    [problem, answer]
  end

  def ex_2
    problem = <<-eos
      By considering the terms in the Fibonacci sequence whose values
      do not exceed four million, find the sum of the even-valued terms.
    eos
    answer = Fibonacci
             .take_while { |n| n < 4_000_000 }
             .select(&:even?)
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
    products = [*100..999]
               .repeated_combination(2)
               .map { |a, b| a * b }

    answer = products
             .sort
             .reverse
             .detect { |n| n.to_s == n.to_s.reverse }

    [problem, answer]
  end

  def ex_5
    problem = <<-eos
      2520 is the smallest number that can be divided by
      each of the numbers from 1 to 10 without any remainder.
      What is the smallest positive number that is evenly
      divisible by all of the numbers from 1 to 20?
    eos
    # From the question we know 2520 can be divided evenly by 1..10
    # so we just go up in steps of 2520 and check the divisors 11..20
    divisors = [*11..20]
    answer = (2520..Float::INFINITY)
             .step(2520)
             .detect do |n|
                divisors.all? { |divisor| n % divisor == 0 }
              end.to_i

    [problem, answer]
  end

  def ex_6
    problem = <<-eos
      Find the difference between the sum of the squares of the
      first one hundred natural numbers and the square of the sum.
    eos
    sum_of_squares = [*1..100].map { |n| n**2 }.reduce(&:+)
    square_of_sum = [*1..100].reduce(&:+)**2
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

  def ex_8
    problem = <<-eos
      Find the thirteen adjacent digits in the 1000-digit number that
      have the greatest product. What is the value of this product?
    eos
    thousand_digit_number = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450

    windows = Substrings.new(thousand_digit_number.to_s).of_length(13)
    products = windows.map do |window|
      window.split('').map(&:to_i).reduce(&:*)
    end
    answer = products.max

    [problem, answer]
  end

  def ex_9
    problem = <<-eos
      There exists exactly one Pythagorean triplet for which a + b + c = 1000.
      Find the product abc.
    eos
    a, b, c = [*1..1000]
              .repeated_combination(2)
              .flat_map do |(a, b)|
                c = Math.sqrt(a**2 + b**2)
                a + b + c == 1000 ? [a, b, c] : []
              end
    answer = a * b * c

    [problem, answer.to_i]
  end

  def ex_10
    problem = <<-eos
      Find the sum of all the primes below two million.
    eos
    answer = Primes.up_to(2_000_000).reduce(&:+)

    [problem, answer]
  end
end
