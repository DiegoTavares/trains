require_relative 'graph'

class GraphOper
  attr_accessor :graph

  #edge_list: string with the graph and weights, like AB5 BC2 AD3 DB6
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
  def shortest_route source, target
    nodes = Hash.new
    #fill nodes hash with vertexes and INFINITY weights and mark them as not visited
    @graph.vertexes.collect { |x| nodes[x] = {
                                    :value => Float::INFINITY,
                                    :visited => false } }
    nodes[source] = {:value => 0, :visited => true}
    current = source

    until nodes.select{|k,v| v[:visited] == false}.empty?
      nodes[current][:visited] = true

      @graph.from(current).each do |vertex|
        dist = @graph[current, vertex] + nodes[current][:value]
        #update the distance of 0 valued nodes to allow cicles starting and ending
        # on the same node
        if dist < nodes[vertex][:value] || nodes[vertex][:value] == 0
          nodes[vertex][:value] = dist
        end
      end

      not_visited = nodes.select{|k,v| v[:visited] == false}
      current = not_visited.min_by{|k,v| v[:value]}[0] unless not_visited.empty?
    end

    return nodes[target][:value]
  end

  #Returns the number of routes between :source and :target
  # with a distance lower than :max_distance
  def num_routes_distance_less source, target, max_distance
    num_routes source, target, max_distance -1
  end

  #Returns the number of routes between :source and :target
  # with a number of stops lower than :num_stops
  def num_routes_max_stops source, target, num_stops
    num_routes source, target, num_stops, false, false
  end

  #Returns the number of routes between :source and :target
  # with a number of stops equals :num_stops
  def num_routes_exact_stops source, target, num_stops
    num_routes source, target, num_stops, true, false
  end

  #Dinamic Programming
  #Calculates the distance of each size of route between :source and :target
  # lower than or equals to :max_distance
  # uses_exact: true to restrict routes with distance equals to :max_distance
  # uses_distance: false to calculate stops
  def num_routes source, target, max_distance,
                      uses_exact = false,
                      uses_distance = true

    route_dist_arr = Array.new(max_distance+1) {{}}

    #for each possible distance
    for curr_dist in 0..max_distance
      #for each source vertex
      @graph.vertexes.each do |vertex|

        counter = 0
        #for each edge
        @graph.from(vertex).each do |target_vertex|
          edge_dist = uses_distance ? @graph[vertex, target_vertex] : 1

          if edge_dist <= curr_dist
            counter += route_dist_arr[curr_dist - edge_dist][target_vertex]
          end
        end

        if vertex == target && (curr_dist == 0 || !uses_exact)
          counter += 1
        end
        #puts "curr_dist = #{curr_dist}"
        #puts "vertex = #{vertex}"
        route_dist_arr[curr_dist][vertex] = counter
        #puts "counter = #{counter}"
      end
    end
    out = route_dist_arr[max_distance][source]

    return (source == target && !uses_exact) ? out -1 : out
  end

end
