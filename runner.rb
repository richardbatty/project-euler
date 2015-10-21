Dir["lib/exercises/*"].each {|file| require_relative file }

puts '===================================================================='
puts Euler.send("ex_#{ARGV[0]}")
