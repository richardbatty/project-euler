$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'rspec/core/rake_task'
require 'csv'

RSpec::Core::RakeTask.new(:spec)

task :acceptance, [:exercise] do |t, args|
  Dir["lib/exercises/*"].each {|file| require_relative file }

  answers_array = CSV.read('spec/acceptance/answers.csv')
  answers = answers_array.reduce({}) do |hash, (key, value)|
    hash.merge(key => value.to_i)
  end
  correct_answer = answers[args.exercise]
  problem, suggested_answer = Euler.send("ex_#{args.exercise}")
  puts problem
  if correct_answer == suggested_answer
    puts "Correct! The answer is #{suggested_answer}"
  else
    puts "No, the answer is #{correct_answer}, not #{suggested_answer}"
  end
end

task :run, [:exercise] do |t, args|
  Dir["lib/exercises/*"].each {|file| require_relative file }
  puts '================================================================='
  puts Euler.send("ex_#{args.exercise}")
end
