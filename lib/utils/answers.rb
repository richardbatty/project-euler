require 'csv'

class Answers

  def initialize
    @answers = CSV.read('spec/acceptance/answers.csv')
  end

  def find(exercise_no)
    @answers.detect do |question, answer|
      question.to_i == exercise_no.to_i
    end[1].to_i
  end
end
