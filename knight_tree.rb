require_relative 'knight.rb'
require_relative 'chess_board.rb'

class KnightTree
  attr_accessor :root

  def initialize(location)
    @root = Knight.new(location)
    @board = Board.new
  end

  def knight_moves(location, root = @root)
    node = breadth_first_traversal(location, root)
    node_path = find_path(node)
    path_to_string(node_path)
  end

  def breadth_first_traversal(location, root)
    queue = Queue.new.enq(root)
    current_knight = nil

    loop do
      current_knight = queue.pop

      break if current_knight.location == location

      moves = current_knight.possible_moves
      moves.each do | move |
        queue << Knight.new(move, current_knight)
      end
    end

    current_knight
  end

  def find_path(knight_node)
    path = []
    current_knight = knight_node

    until current_knight.nil?
      path << (current_knight.location)
      current_knight = current_knight.parent
    end

    path.reverse
  end

  def path_to_string(path)
    puts "\n" + "only #{path.length} steps from #{path[0]} to #{path[-1]}! here's the path:"
    puts ''

    path.each do |step|
      sleep 1
      p step
      @board.mark_spots([step])
      puts @board.display
      puts ''
    end
  end
end
