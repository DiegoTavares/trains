require_relative '../graph.rb'

describe Graph do

  before :each do
    @graph = Graph.new 4, ['AB5', 'BC2', 'AD3', 'DB6']
  end

  describe "#new" do
    it "populates the graph_matrix with weights" do
      expect(@graph.vertexes.length).to eq 4
    end
  end

  describe "#[]" do
    it "returns the weight of the edges" do
      expect(@graph['A', 'B']).to eq 5
      expect(@graph['B', 'C']).to eq 2
      expect(@graph['A', 'D']).to eq 3
      expect(@graph['D', 'B']).to eq 6
    end
  end
end
