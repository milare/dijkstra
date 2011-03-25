require File.dirname(__FILE__) + '/spec_helper'
require 'edge'
require 'vertex'
require 'graph'
require 'dijkstra'

describe Dijkstra do

  it "should instantiate a new dijsktra" do
    Dijkstra.new.class.should == Dijkstra
  end

  it "should find the short path" do
    g = Graph.new
    a = Vertex.new("Campinas")
    b = Vertex.new("Jundiai")
    c = Vertex.new("Limeira")
    d = Vertex.new("Americana")

    a.add_edge(20,c)
    a.add_edge(10,b)
    b.add_edge(5,c)
    a.add_edge(4,d)
    d.add_edge(2,b)

    g.add_vertices(a,b,c,d)

    #g.print_as_adj_list
    Dijkstra.find_shortest_path(g,a,c)

    Dijkstra.shortest_path_to_a.should == [a,d,b,c]

  end

end

