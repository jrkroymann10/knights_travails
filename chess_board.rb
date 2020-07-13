require 'colorize'

class Board
  attr_accessor :display, :adjustments, :coordinates
  def initialize
    @adjustment = 10
    @coordinates = []
    @display = [['    __ __ __ __ __ __ __ __    '.colorize(:black).on_cyan]]
    square = '__'.colorize(:black).on_cyan + '|'.colorize(:black).on_cyan
    row = (square * 8) + '   '.colorize(:black).on_cyan
    0.upto(7) { |x| @display.push([" #{x} |".colorize(:black).on_cyan + row]) }
    @display.push(['                               '.colorize(:black).on_cyan])
  end

  def mark_spots(coords)
    for i in 0...coords.length
      temp = adjust_coords(coords[i])
      unless @coordinates.include?(temp)
        @display[temp[0]][0].slice!(temp[1], 10)
        @coordinates << temp
      end
    end
  end

  private

  def adjust_coords(coords)
    mult = 0
    temp_one = coords[0] + 1
    temp_two = (18 + (coords[1] * 31))
    for i in 0...@coordinates.length
      if @coordinates[i][0] == temp_one && @coordinates[i][1] < temp_two
        mult += 1
      end
    end
    temp_two -= (@adjustment * mult)
    [temp_one, temp_two]
  end
end
