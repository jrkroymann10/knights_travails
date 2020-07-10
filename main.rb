require_relative 'chess_board.rb'
require_relative 'graph.rb'

graph = Graph.new
board = Board.new
graph.add_vertex([0, 1])

graph.build_graph([0, 1])
# board.mark_spots([[0,1]])

# puts board.display

for i in 0..40
  board.mark_spots([graph.vertices[i].square])
  puts ''
  puts board.display
  # sleep 1
end


p graph.knight.moves_made