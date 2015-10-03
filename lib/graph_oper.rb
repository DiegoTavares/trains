require_relative 'graph'

class GraphOper
  attr_accessor :graph

  def initialize graph_string
    vertexes = []

    graph_string.split("").each do |char|
      if char != ' ' && vertexes.index(char).nil?
        vertexes.push(char)
      end
    end

    @graph = Graph.new vertexes.length, graph_string.split(' ')
  end

  def route_distance route
    
  end
end
