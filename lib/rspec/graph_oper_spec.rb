require_relative '../graph_oper.rb'

describe GraphOper do

  before :each do
    @graph_oper = GraphOper.new ["AB5", "BC2", "AD1", "DB1", "BA10"]
  end

  describe "#new" do
    it "creates the graph_oper" do
      expect(@graph_oper).to be_instance_of(GraphOper)
    end

    it "creates the graph_oper graph" do
      expect(@graph_oper.graph).to be_instance_of(Graph)
      expect(@graph_oper.graph.vertexes.length).to eq 4
    end

    #TODO: Verify rule
    # it "cannot create a ciclic graph" do
    #   expect(GraphOper.new "AB1 BC1 CA1").to raise_error("INVALID GRAPH")
    # end
  end

  describe "#route_distance" do
    it "measure the distance of route size 2" do
      expect(@graph_oper.route_distance("AB")).to eq 5
    end

    it "measure the distance of route size 3" do
      expect(@graph_oper.route_distance("ABC")).to eq 7
    end

    it "measure the distance of route size 4" do
      expect(@graph_oper.route_distance("ADBC")).to eq 4
      expect(@graph_oper.route_distance("ABA")).to eq 15
    end

    it "cannot measure the distance of unexisting route" do
      expect(@graph_oper.route_distance("ABD")).to eq nil
    end

    it "raises exception on invalid route A" do
      expect { @graph_oper.route_distance("A")}.to raise_error("INVALID ROUTE")
    end

  end

  describe "#shortest_route" do
    it "obtains the shortest distance between 2 vertexes" do
      expect(@graph_oper.shortest_route "AC").to eq 4
      expect(@graph_oper.shortest_route "AB").to eq 2
      expect(@graph_oper.shortest_route "DC").to eq 3
    end

    it "obtains the shortest distance between 1 vertex cicle" do
      expect(@graph_oper.shortest_route "AA").to eq 12
    end
  end

  describe "#num_routes" do
    it "obtains the number of routes from X to Y with distance equal or lower than" do
      expect(@graph_oper.num_routes 'A', 'C', 10).to eq 2
      expect(@graph_oper.num_routes 'A', 'B', 20).to eq 6
      expect(@graph_oper.num_routes 'A', 'D', 30).to eq 6
      expect(@graph_oper.num_routes 'A', 'A', 24).to eq 3
    end

    it "obtains the number of routes from X to X with distance equal or lower than" do
      expect(@graph_oper.num_routes 'A', 'A', 24).to eq 3
    end
  end

  describe "#num_routes_distance_less" do
    it "obtains the number of routes with distance lower than" do
      expect(@graph_oper.num_routes_distance_less 'A', 'A', 24).to eq 2
    end
  end

  describe "#num_routes_max_stops" do
    it "obtains the number of routes from X to Y with num stops equal or lower than" do
      expect(@graph_oper.num_routes_max_stops 'A', 'B', 3).to eq 3
    end

    it "obtains the number of routes from X to X with num stops equal or lower than" do
      expect(@graph_oper.num_routes_max_stops 'A', 'A', 4).to eq 3
    end
  end

  describe "#num_routes_exact_stops" do
    it "obtains the number of routes from X to Y with num stops equal to" do
      expect(@graph_oper.num_routes_exact_stops 'A', 'B', 3).to eq 1
    end

    it "obtains the number of routes from X to X with num stops equal to" do
      expect(@graph_oper.num_routes_exact_stops 'A', 'A', 5).to eq 2
    end
  end



  describe

end
