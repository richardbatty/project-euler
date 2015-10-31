$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'rspec/core/rake_task'
require_relative 'lib/utils/answers'
require_relative 'lib/exercises'

RSpec::Core::RakeTask.new(:spec)

def format_result(problem, suggested_answer, correct_answer)
  if correct_answer == suggested_answer
    "#{problem}\n      Correct! The answer is #{suggested_answer}"
  else
    "#{problem}\n      No, the answer is #{correct_answer}, not #{suggested_answer}"
  end
end

task :acceptance, [:exercise_no] do |t, args|
  puts
  puts format_result(
    *Euler.exercise(args.exercise_no),
    Answers.new.find(args.exercise_no)
  )
end

task :all do |t, args|
  answers = Answers.new
  puts
  Euler.exercises_answered.each do |exercise_no|
    puts "Exercise #{exercise_no}"
    puts format_result(
      *Euler.exercise(exercise_no),
      answers.find(exercise_no)
    )
    puts
  end
end
