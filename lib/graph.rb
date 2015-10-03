class Graph
  attr_accessor :graph_matrix

  def initialize edge_list
    vertex_list = []
    edge_list.each do |item|
      item[0..1].split('').each do |letter|
        vertex_list.push(letter) if vertex_list.index(letter).nil?
      end
    end
    #TODO: Populate the graph matrix
  end

  def length
    @graph_matrix.nil? ? 0 : @graph_matrix.length
  end

end
