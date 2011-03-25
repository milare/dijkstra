require File.dirname(__FILE__) + '/spec_helper'
require 'map'
require 'tile'
require 'vertex'
require 'edge'

describe Map do


  it "should create a new map" do
    map = Map.new(File.dirname(__FILE__) + '/map.txt')
  end


end

