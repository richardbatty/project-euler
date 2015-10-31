module Primes
  extend self

  def nth(n)
    up_to(_upper_bound(n))[n - 1]  # convert to 0-indexed
  end

  def up_to(n)
    # start by assuming all ints are prime
    # integer_states is an array where is_prime(i) == integer_states[i]
    integer_states = Array.new(n){|i| true}
    prime = 2
    while prime
      integer_states = _sieve(prime, integer_states)
      prime = _next_prime(prime, integer_states)
    end
    prime_numbers_from_integer_states(integer_states)
  end

  # 'Private'

  def prime_numbers_from_integer_states(integer_states)
    integer_states
      .each_with_index
      .flat_map{|is_prime, i| is_prime ? [i] : []}
      .drop(2) # because 0 and 1 are not prime
  end

  def _upper_bound(n)
    # From http://stackoverflow.com/a/1069023
    # Formula gives upper bound for nth prime where n >= 6
    if n >= 6
      (n * Math.log(n) + n * Math.log(Math.log(n))).to_i
    else
      13
    end
  end

  def _next_prime(current_prime, integer_states)
    n = integer_states.length
    ((current_prime + 1)..n).find do |integer|
      integer_states[integer] == true
    end
  end

  def _sieve(prime, integer_states)
    n = integer_states.length
    ((2*prime)..n).step(prime).each do |integer|
      integer_states[integer] = false
    end
    integer_states
  end
end
