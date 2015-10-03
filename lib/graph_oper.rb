require_relative 'graph'

class GraphOper
  attr_accessor :graph

  def initialize graph_string
    @graph = Graph.new graph_string.split(' ')
  end

  def route_distance route

  end
end
