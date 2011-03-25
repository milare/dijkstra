require File.dirname(__FILE__) + '/spec_helper'
require 'edge'
require 'vertex'
require 'graph'

describe Graph do

  it "should instantiate a new graph" do
    Graph.new.class.should == Graph
  end

  it "should create a new graph" do
    g = Graph.new
    v1 = Vertex.new("Campinas")
    v2 = Vertex.new("Jundiai")
    v3 = Vertex.new("Limeira")
    v4 = Vertex.new("Americana")

    v1.add_edge(1,v2)
    v1.add_edge(2,v3)
    v1.add_edge(3,v4)

    v2.add_edge(4,v1)
    v2.add_edge(2,v3)
    v2.add_edge(3,v4)

    v3.add_edge(4,v1)
    v3.add_edge(5,v2)
    v3.add_edge(3,v4)

    v4.add_edge(4,v1)
    v4.add_edge(5,v2)
    v4.add_edge(3,v3)

    g.add_vertices(v1, v2, v3, v4)

    g.vertices.count.should == 4
  end

end

