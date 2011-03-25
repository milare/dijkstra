require File.dirname(__FILE__) + '/spec_helper'
require 'edge'
require 'vertex'

describe Edge do

  it "should create a new edge" do
    Edge.new.class.should == Edge
  end

  it "should create a new instance of edge" do
    v1 = Vertex.new("Campinas")
    v2 = Vertex.new("Jundiai")
    weight = 10
    e = Edge.new(weight, v1, v2)
    e.vertices.should == [v1,v2]
  end
end

