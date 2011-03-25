require 'rubygems'
require 'lib/map'
require 'lib/tile'
require 'lib/vertex'
require 'lib/edge'
require 'lib/dijkstra'

map = Map.new(File.dirname(__FILE__) + '/spec/map.txt')

#map.walk_test
require 'sdl'


SDL.init SDL::INIT_VIDEO
screen = SDL::set_video_mode 640, 480, 24, SDL::SWSURFACE
x = y = 0


BGCOLOR = screen.format.mapRGB 0, 0, 0
LINECOLOR = screen.format.mapRGB 255, 255, 255

running = true

while running
  while event = SDL::Event2.poll
    case event
    when SDL::Event2::Quit
      running = false
    when SDL::Event2::MouseMotion
      x = event.x
      y = event.y
      end
  end
  screen.fill_rect 0, 0, 640, 480, BGCOLOR
  print "                        \r"
  print "MOUSE: #{x}, #{y}\r"
end
