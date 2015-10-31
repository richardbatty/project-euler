require_relative 'spec_helper'
require 'utils/answers'

describe Answers do

  it 'reads in the csv' do
    expect(CSV).to receive(:read).with('spec/acceptance/answers.csv')
    subject
  end

  it 'finds the answer to a question' do
    expect(CSV).to receive(:read).and_return([[1, 30], [2, 550], [3, 100]])
    expect(subject.find(3)).to eq(100)
  end

  it 'error if answer not found' do
    expect(CSV).to receive(:read).and_return([[1, 30], [2, 550], [3, 100]])
    expect{subject.find(10)}.to raise_error(Answers::AnswerNotFound)
  end

end
