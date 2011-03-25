require File.dirname(__FILE__) + '/spec_helper'
require 'tile'

describe Tile do

  it "should create a new tile" do
    Tile.new(TILE_CLEAR, "c", 0, 0)
  end

end

