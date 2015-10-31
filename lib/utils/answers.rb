require 'csv'

class Answers
  class AnswerNotFound < StandardError; end

  def initialize
    @solutions = CSV.read('spec/acceptance/answers.csv')
  end

  def find(exercise_no)
    solution = @solutions.detect do |question, _answer|
      question.to_i == exercise_no.to_i
    end
    fail AnswerNotFound unless solution
    solution[1].to_i
  end
end
