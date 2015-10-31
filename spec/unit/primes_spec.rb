require_relative 'spec_helper'
require 'utils/primes'

describe Primes do
  it 'returns the first 50 primes' do
    primes_up_to_50 = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
    expect(Primes.up_to(50)).to eq(primes_up_to_50)
  end

  it 'returns the 10th prime' do
    expect(Primes.nth(10)).to eq(29)
  end

  it 'returns the 1st prime' do
    expect(Primes.nth(1)).to eq(2)
  end
end
