module Primes
  extend self

  def nth(n)
    primes_up_to(upper_bound(n).to_i)[n - 1]  # convert to 0-indexed
  end

  def primes_up_to(n)
    ints = [*2..n]
    prime = 2
    while prime
      ints = sieve(prime, ints)
      prime = next_prime(prime, ints)
    end
    ints
  end

  def upper_bound(n)
    # From http://stackoverflow.com/a/1069023
    # Formula gives upper bound for nth prime where
    # n >= 6
    if n >= 6
      n * Math.log(n) + n * Math.log(Math.log(n))
    else
      13
    end
  end

  def next_prime(current_prime, ints)
    ints.find do |n|
      n > current_prime
    end
  end

  def sieve(prime, list)
    list.select do |n|
      n % prime != 0
    end.push(prime)
  end
end
