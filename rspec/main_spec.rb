require_relative 'spec_helper'

describe Main do

  before :each do
    @main = Main.new
  end

  describe "#execute" do

    it "returns a test string" do
      expect(@main.execute).to eq "test"
    end
  end

end
