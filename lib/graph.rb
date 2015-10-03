require_relative 'mutable_matrix'

class Graph
  attr_reader :vertexes

  #num_vertex: number of vertex on the graph
  #edge_list: ['AB5', 'AC2', ...]
  def initialize num_vertex, edge_list
    @vertexes = []
    @graph_matrix = MutableMatrix.build(num_vertex) { nil }

    edge_list.each do |item|
      item[0..1].split('').each do |letter|
        vertexes.push(letter) if vertexes.index(letter).nil?
      end

      @graph_matrix[vertexes.index(item[0]),
                    vertexes.index(item[1])] = item[2].to_i
    end

  end

  #returns the weigh of the edge between vertex i_s and j_s (strings)
  def [] (i_s, j_s)
    i = @vertexes.index(i_s)
    j = @vertexes.index(j_s)

    if i != j && !i.nil? && !j.nil?
      @graph_matrix[i, j]
    else
      nil
    end
  end


end
