module Primes
  extend self

  def nth(n)
    primes_up_to(_upper_bound(n).to_i)[n - 1]  # convert to 0-indexed
  end

  def primes_up_to(n)
    ints = Array.new(n){|i| true}
    prime = 2
    while prime
      ints = _sieve(prime, ints)
      prime = _next_prime(prime, ints)
    end
    ints.each_with_index.flat_map{|int, i| int ? [i] : []}.drop(2)
  end

  # 'Private'

  def _upper_bound(n)
    # From http://stackoverflow.com/a/1069023
    # Formula gives upper bound for nth prime where
    # n >= 6
    if n >= 6
      n * Math.log(n) + n * Math.log(Math.log(n))
    else
      13
    end
  end

  def _next_prime(current_prime, ints)
    ((current_prime + 1)..(ints.length)).find do |n|
      ints[n] == true
    end
  end

  def _sieve(prime, list)
    ((2*prime)..(list.length)).step(prime).each do |n|
      list[n] = false
    end
    list
  end
end
