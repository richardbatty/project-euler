module Factors
  extend self

  def largest_prime_factor(n)
    factors = factors_of(n, Math.sqrt(n))
    prime_factors = factors.reverse.select do |factor|
      !divisible_by_any(factor, factors)
    end
    prime_factors[0]
  end

  def factors_of(n, max)
    [*2..(max.to_i)].select do |i|
      n % i == 0
    end
  end

  def divisible_by_any(n, potential_factors)
    potential_factors.any? do |potential_factor|
      n != potential_factor && n % potential_factor == 0
    end
  end
end
