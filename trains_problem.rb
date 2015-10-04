require_relative "lib/graph_oper"

class TrainsProblem
  attr_reader :graph_oper, :output

  #graph_s: string with weighted edges divided by comma (,)
  def initialize graph_s
    @graph_oper = GraphOper.new graph_s.gsub(/\s+/, "").split(",")
  end

  # 1.  The distance of the route A-B-C.
  # 2.  The distance of the route A-D.
  # 3.  The distance of the route A-D-C.
  # 4.  The distance of the route A-E-B-C-D.
  # 5.  The distance of the route A-E-D.
  # 6.  The number of trips starting at C and ending at C with a maximum of 3
  #     stops. In the sample data below, there are two such trips: C-D-C
  #     (2stops). and C-E-B-C (3 stops).
  # 7.  The number of trips starting at A and ending at C with exactly 4 stops.
  #     In the sample data below, there are three such trips: A to C (via B,C,D);
  #     A to C (via D,C,D); and A to C (via D,E,B).
  # 8.  The length of the shortest route (in terms of distance to travel) from A
  #     to C.
  # 9.  The length of the shortest route (in terms of distance to travel) from B
  #     to B.
  # 10. The number of different routes from C to C with a distance of less than
  #     30. In the sample data, the trips are: CDC, CEBC, CEBCDC, CDCEBC, CDEBC,
  #     CEBCEBC, CEBCEBCEBC.
  def execute
    @output = []

    @output.push @graph_oper.route_distance "ABC"                       #1
    @output.push @graph_oper.route_distance "AD"                        #2
    @output.push @graph_oper.route_distance "ADC"                       #3
    @output.push @graph_oper.route_distance "AEBCD"                     #4
    @output.push @graph_oper.route_distance "AED"                       #5
    @output.push @graph_oper.num_routes_max_stops "C", "C", 3           #6
    @output.push @graph_oper.num_routes_exact_stops "A", "C", 4         #7                                       #7
    @output.push @graph_oper.shortest_route "A", "C"                    #8
    @output.push @graph_oper.shortest_route "B", "B"                    #9
    @output.push @graph_oper.num_routes_distance_less "C", "C", 30      #10

    @output
  end

  def to_s
    out_s = ""
    if !@output.nil?
      @output.each_index do |out_index|
        out_value = @output[out_index]

        #For test input 1 through 5, if no such route exists, output 'NO SUCH ROUTE'
        if out_value.nil? && out_index.between?(0, 4)
          out_value = "NO SUCH ROUTE"
        end

        out_s += "Output\##{out_index+1}: #{out_value}\n"
      end
    end

    return out_s
  end
end
