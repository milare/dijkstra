require 'rubygems'
require 'lib/map'
require 'lib/tile'
require 'lib/vertex'
require 'lib/edge'
require 'lib/dijkstra'

map = Map.new(File.dirname(__FILE__) + '/spec/map.txt')

map.walk_test
