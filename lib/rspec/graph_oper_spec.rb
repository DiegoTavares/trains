require_relative '../graph_oper.rb'

describe Graph_oper do

  before :each do
    @graph_oper = Graph_oper.new "AB5 BC2 AD3"
  end

  describe "#new" do
    it "populates the graph" do
      expect(@graph_oper.graph.length).be eq 4
    end
  end

end
