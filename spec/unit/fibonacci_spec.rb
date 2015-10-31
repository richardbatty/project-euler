require_relative 'spec_helper'

describe Fibonacci do
  it 'returns the first 2 fibonacci numbers' do
    expect(Fibonacci.take(2)).to eq([1, 2])
  end

  it 'returns the first 10 fibonacci numbers' do
    expect(Fibonacci.take(10)).to eq([1, 2, 3, 5, 8, 13, 21, 34, 55, 89])
  end
end
