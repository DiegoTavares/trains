require_relative '../graph.rb'

describe Graph do

  before :each do
    @graph = Graph.new ['A', 'B', 'C', 'D'],
                       ['AB5', 'BC2', 'AD3', 'DB16']
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
      expect(@graph['D', 'B']).to eq 16
    end
  end

  describe "#from" do
    it "returns an empty list for end vertexes" do
      expect(@graph.from('C')).to eq []
    end

    it "returns the list of vertexes that receives edges" do
      expect(@graph.from('A')).to eq ['B', 'D']
      expect(@graph.from('B')).to eq ['C']
      expect(@graph.from('D')).to eq ['B']
    end

    it "raises an error for invalid vertexes" do
      expect{@graph.from('J')}.to raise_error("INVALID VERTEX")
    end
  end
end
