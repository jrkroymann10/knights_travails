class Knight
  attr_accessor :location, :parent
  def initialize(location, parent = nil)
    @location = location # location = [row, column]
    @parent = parent
  end

  def possible_moves(location = @location)
    all_moves = [[location[0] + 2, location[1] + 1], [location[0] + 1, location[1] + 2],
                 [location[0] + 2, location[1] - 1], [location[0] + 1, location[1] - 2],
                 [location[0] - 2, location[1] + 1], [location[0] - 1, location[1] + 2],
                 [location[0] - 2, location[1] - 1], [location[0] - 1, location[1] - 2]]

    all_moves.filter { |move| move[0] >= 0 && move[0] <= 7 && move[1] >= 0 && move[1] <= 7 }
  end
end
