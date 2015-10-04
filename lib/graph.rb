require_relative 'mutable_matrix'

class Graph
  attr_reader :vertexes

  #num_vertex: number of vertex on the graph
  #edge_list: ['AB5', 'AC2', ...]
  def initialize vertexes, edge_list
    @vertexes = vertexes
    @graph_matrix = MutableMatrix.build(vertexes.length) { nil }

    edge_list.each do |edge|
      @graph_matrix[vertexes.index(edge[0]),
                    vertexes.index(edge[1])] = edge[2..-1].to_i
    end

  end

  #returns the weigh of the edge between vertex i_s and j_s (strings)
  def [] (i_s, j_s)
    i = @vertexes.index(i_s)
    j = @vertexes.index(j_s)

    if i != j && !i.nil? && !j.nil?
      return @graph_matrix[i, j]
    else
      return nil
    end
  end

  # returns the vertexes that receive edges from :source
  # returns [] no edges
  # raises "INVALID VERTEX" for invalid vertex id
  #  source: Char id of the vertex
  def from source
    source_vertex = @vertexes.index(source)
    raise "INVALID VERTEX" if source_vertex.nil?

    out = []
    index = 0
    @graph_matrix.row(source_vertex).each do |adjacent_weight|
      out.push @vertexes[index] if !adjacent_weight.nil?
      index += 1
    end

    return out
  end


end
