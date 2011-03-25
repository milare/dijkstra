require  File.dirname(__FILE__) + '/vertex'

TILE_CLEAR = 1
TILE_GRASS = 10
TILE_OBSTACLE = 999999


class Tile < Vertex

  attr_accessor :x, :y, :type

  def initialize(type=TILE_CLEAR, value = "c", x = 0, y = 0 )
    super(value)
    @x = x
    @y = y
    @type = type
  end

end

