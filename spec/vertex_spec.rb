require File.dirname(__FILE__) + '/spec_helper'
require 'vertex'
require 'edge'

describe Vertex do

  it "should create a new vertex" do
    Vertex.new.class.should == Vertex
  end

  it "should create a new instance of vertex" do
    v = Vertex.new("Campinas")
    v.value.should == "Campinas"
  end

  it "should add one undirected edge to a vertex" do
    v = Vertex.new("Campinas")
    v2 = Vertex.new("Jundiai")
    weight = 10
    v.add_edge(weight, v2, false)
    v.edges.count.should == 2
  end

  it "should add one directed edge to a vertex" do
    v = Vertex.new("Campinas")
    v2 = Vertex.new("Jundiai")
    weight = 10
    v.add_edge(weight, v2, true)
    v.edges.count.should == 1
  end

  it "should add many undirected edges to a vertex" do
    v = Vertex.new("Campinas")
    v2 = Vertex.new("Jundiai")
    v3 = Vertex.new("Limeira")
    v4 = Vertex.new("Americana")
    weight2 = 10
    weight3 = 5
    weight4 = 1

    v.add_edge(weight2, v2)
    v.add_edge(weight3, v3)
    v.add_edge(weight4, v4)

    v.edges.count.should == 6
  end

  it "should add many directed edges to a vertex" do
    v = Vertex.new("Campinas")
    v2 = Vertex.new("Jundiai")
    v3 = Vertex.new("Limeira")
    v4 = Vertex.new("Americana")
    weight2 = 10
    weight3 = 5
    weight4 = 1

    v.add_edge(weight2, v2, true)
    v.add_edge(weight3, v3, true)
    v.add_edge(weight4, v4, true)

    v.edges.count.should == 3
  end

  it "should return the adjacents" do
    v = Vertex.new("Campinas")
    v2 = Vertex.new("Jundiai")
    v3 = Vertex.new("Limeira")
    v4 = Vertex.new("Americana")
    weight2 = 10
    weight3 = 5
    weight4 = 1

    v.add_edge(weight2, v2, true)
    v.add_edge(weight3, v3, true)
    v.add_edge(weight4, v4, true)

    v.adjacents.should == [v2,v3,v4]

  end


end

