require_relative 'knight.rb'
require 'pry'

class Vertex
  attr_accessor :square, :neighbors
  def initialize(square)
    @square = square
    @neighbors = []
    @weights = []
  end
end

class Graph
  attr_accessor :vertices, :neighbors, :knight
  def initialize
    @vertices = []
    @knight = Knight.new
  end

  def build_graph(root)

    @knight.root = root
    temp = @knight.possible_moves
    return if temp.nil?

    temp.each do | square |
      add_vertex(square)
    end

    temp.each do | square |
      add_edge(root, square)
    end

    temp.each do | square |
      build_graph(square)
    end

    p @knight.moves_made
  end

  def add_vertex(square)
    @vertices << Vertex.new(square)
  end

  def vertice_count
    @vertices.length
  end

  def find_vertice_by_square(square)
    @vertices.each do |vert|
      return vert if vert.square == square
    end
    nil
  end

  def add_edge(vert1_sq, vert2_sq, weight = nil, undirected = true)
    from = @vertices.index { |vertex| vertex.square == vert1_sq }
    to = @vertices.index { |vertex| vertex.square == vert2_sq }
    @vertices[from].neighbors[to] = true
    @vertices[from].weights[to] = weight if weight

    return unless undirected

    @vertices[to].neighbors[from] = true
    @vertices[to].weights[from] = weight if weight
  end
end

# x = Graph.new
# x.add_vertex([0, 1])
# # x.add_vertex([1, 1])
# # x.add_vertex([2, 2])
# # x.add_vertex([3, 3])
# # x.add_edge([0, 1], [3, 3])
# # x.add_edge([3, 3], [1, 1])
# x.build_graph([0, 1])

# for i in 0..40
#   p x.vertices[i].square
# end
