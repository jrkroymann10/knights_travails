require_relative 'knight_tree.rb'
require 'colorize'


puts "\n" + "                                 Welcome to Knight's Travails!".colorize(:cyan)

puts "\n" + 'here, you can find the shortest, most simple path a knight can take from one square to another on a chess board'

print "\n" + 'please choose your starting square (row, column): '
start = gets.chomp.split(',')
start[0] = start[0].to_i
start[1] = start[1].to_i

knight_tree = KnightTree.new(start)

print 'please choose your ending square (row, column): '
end_point = gets.chomp.split(',')
end_point[0] = end_point[0].to_i
end_point[1] = end_point[1].to_i

knight_tree.knight_moves(end_point)
