require 'pry'

class Knight
  attr_accessor :root, :moves_made
  def initialize(pos = [0, 1])
    @root = pos
    @moves_made = []
  end

  def possible_moves
    temp = all_moves
    temp = remove_impossible_moves(temp)
    temp.each do |move|
      @moves_made.push(move) unless move.nil?
    end
    temp
  end

  def all_moves
    [[@root[0] - 1, @root[1] - 2], [@root[0] - 2, @root[1] - 1], [@root[0] - 2, @root[1] + 1], [@root[0] - 1, @root[1] + 2], 
      [@root[0] + 1, @root[1] + 2], [@root[0] + 2, @root[1] + 1], [@root[0] + 2, @root[1] - 1], [@root[0] + 1, @root[1] - 2]]
  end

  def remove_impossible_moves(moves)
    poss_moves = []
    moves.each do |move|
      if move[0] >= 0 && move[0] <= 7 && move[1] >= 0 && move[1] <= 7 && !@moves_made.include?(move)
        poss_moves << move
      end
    end
    poss_moves
  end
end


# x = Knight.new([7, 7])
# x.possible_moves
