require_relative 'graph'

class GraphOper
  attr_accessor :graph

  #graph_string: string with the graph and weights, like AB5 BC2 AD3 DB6
  def initialize edge_list
    vertexes = []

    edge_list.each do |edge|
      edge.strip[0..1].split('').each do |char|
        vertexes.push(char) if vertexes.index(char).nil?
      end
    end
    @graph = Graph.new vertexes, edge_list
  end

  #calculate the distance of a route
  #route: ABC
  def route_distance route
    distance = 0
    raise "INVALID ROUTE" if route.length < 2

    #walk the route
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

  #Dijkstra Algotrithm
  def shortest_route from_to
    source = from_to[0]
    target = from_to[1]

    nodes = Hash.new
    @graph.vertexes.collect { |x| nodes[x] = {
                                    :value => Float::INFINITY,
                                    :visited => false } }
    nodes[source] = {:value => 0, :visited => true}
    current = source

    until nodes.select{|k,v| v[:visited] == false}.empty?
      nodes[current][:visited] = true
      # puts "nodes #{nodes}"
      # puts "current = #{current}"
      @graph.from(current).each do |vertex|
        dist = @graph[current, vertex] + nodes[current][:value]
        if dist < nodes[vertex][:value] || nodes[vertex][:value] == 0
          nodes[vertex][:value] = dist
        end
      end

      not_visited = nodes.select{|k,v| v[:visited] == false}
      current = not_visited.min_by{|k,v| v[:value]}[0] unless not_visited.empty?
    end

    return nodes[target][:value]
  end


end
