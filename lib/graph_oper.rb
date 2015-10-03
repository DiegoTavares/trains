require_relative 'graph'

class GraphOper
  attr_accessor :graph

  #graph_string: string with the graph and weights, like AB5 BC2 AD3 DB6
  def initialize graph_string
    vertexes = []

    graph_string.split("").each do |char|
      if char != ' ' && vertexes.index(char).nil?
        vertexes.push(char)
      end
    end

    @graph = Graph.new vertexes.length, graph_string.split(' ')
  end

  #calculate the distance of a route
  #route: ABC
  def route_distance route
    distance = 0
    raise "INVALID ROUTE" if route.length < 2

    #wall the route
    route[0..-2].split("").each_index do |v_index|
      #take slots of size 2
      edge_dist = @graph[route[v_index], route[v_index + 1]]
      if edge_dist.nil?
        return nil
      else
        distance += edge_dist
      end
    end

    return distance
  end


end
