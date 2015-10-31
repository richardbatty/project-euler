module Factors
  extend self

  def largest_prime_factor(n)
    factors = _factors_of(n, Math.sqrt(n))
    prime_factors = factors.reverse.select do |factor|
      !_divisible_by_any(factor, factors)
    end
    prime_factors[0]
  end

  # 'Private'

  def _factors_of(n, max)
    [*2..(max.to_i)].select do |i|
      n % i == 0
    end
  end

  def _divisible_by_any(n, potential_factors)
    potential_factors.any? do |potential_factor|
      n != potential_factor && n % potential_factor == 0
    end
  end
end
