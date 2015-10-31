require_relative 'spec_helper'
require 'utils/string_windows'

describe Substrings do
  let(:subject) { Substrings.new('abcdefg') }

  it 'finds the windows' do
    expect(subject.of_length(3)).to eq(
      ['abc', 'bcd', 'cde', 'def', 'efg']
    )
  end

end
