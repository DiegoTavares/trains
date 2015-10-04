require_relative "trains_problem"

#command line execution

#default input
input = "AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7"

input = ARGV[0] unless ARGV.empty?

main = TrainsProblem.new input
main.execute
puts main
