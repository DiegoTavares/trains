require_relative '../graph_oper.rb'

describe GraphOper do

  before :each do
    @graph_oper = GraphOper.new "AB5 BC2 AD3 DB6"
  end

  describe "#new" do
    it "populates the graph" do
      expect(@graph_oper.graph.length).to eq 4
    end

    it "cannot populate the graph" do
      expect(GraphOper.new "AB1 BC1 CA1").to raise_error("NOT FOUND")
    end
  end

  describe "#route_distance" do
    it "measure the distance of route AB" do
      expect(@graph_oper.route_distance("AB")).to eq 5
    end

    it "measure the distance of route ABC" do
      expect(@graph_oper.route_distance("ABC")).to eq 7
    end

    it "measure the distance of route ADA" do
      expect(@graph_oper.route_distance("ADBC")).to eq 11
    end

    it "cannot measure the distance of route ABD" do
      expect(@graph_oper.route_distance("ABD")).to eq nil
    end
  end

end
