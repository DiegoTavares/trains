require_relative '../trains_problem'

describe TrainsProblem do

  before :each do
    @trains_problem = TrainsProblem.new "AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7"
  end

  describe "#new" do
    it "returns a main instance" do
      expect(@trains_problem).to be_instance_of TrainsProblem
    end

    it "creates a graph operator" do
      expect(@trains_problem.graph_oper.graph.vertexes.length).to eq 5
    end
  end

  describe "#execute" do
    it "returns the output list" do
      expect(@trains_problem.execute).to eq [9, 5, 13, 22, nil, 2, 3, 9, 9, 7]
    end
  end

  describe "#to_s" do
    it "returns an empty string before execution" do
      expect(@trains_problem.to_s).to eq ""
    end

    it "return an output string after the execution" do
      @trains_problem.execute
      expect(@trains_problem.to_s.gsub(/\s+/, "")).to eq "Output #1: 9
                                                Output #2: 5
                                                Output #3: 13
                                                Output #4: 22
                                                Output #5: NO SUCH ROUTE
                                                Output #6: 2
                                                Output #7: 3
                                                Output #8: 9
                                                Output #9: 9
                                                Output #10: 7".gsub(/\s+/, "")
    end
  end

end
