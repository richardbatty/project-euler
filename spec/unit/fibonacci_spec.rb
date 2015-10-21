require_relative 'spec_helper'

describe Fibonacci do

  describe '#enum' do
    it 'returns the first 2 fibonacci numbers' do
      expect(Fibonacci.enum.take(2)).to eq([1, 2])
    end

    it 'returns the first 10 fibonacci numbers' do
      expect(Fibonacci.enum.take(10)).to eq([1, 2, 3, 5, 8, 13, 21, 34, 55, 89])
    end
  end

  describe '#stop_before' do
    it 'returns the fibonacci numbers before 34' do
      expect(Fibonacci.stop_before(34)).to eq([1, 2, 3, 5, 8, 13, 21])
    end

    it 'returns the fibonacci numbers before 10' do
      expect(Fibonacci.stop_before(10)).to eq([1, 2, 3, 5, 8])
    end
  end

end
