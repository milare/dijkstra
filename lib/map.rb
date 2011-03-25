require  File.dirname(__FILE__) + '/graph'
require 'pp'

class Map < Graph

  attr_accessor :vertices

  def initialize(filename)
    super()
    @file_path = filename
    open_file if @file_path
  end

  def open_file
    @file = File.open(@file_path)
    parse
  end


  def parse
    row = []
    @matrix = []
    @file.each_with_index do |line, i|
      row = []
      line_array = line.split
      line_array.each_with_index do |c, j|
        if c == "."
          row << Tile.new(TILE_CLEAR,".",i,j) # . for clear path
        elsif c == "g"
          row << Tile.new(TILE_GRASS,"G",i,j) # g for grass path
        else
          row << Tile.new(TILE_OBSTACLE,"T",i,j) # t for obstacle
        end
      end
      @matrix << row
    end
    @matrix.delete_at(-1)
    create_nodes
  end


  def create_nodes

    @matrix.each_with_index do |row, row_i|

      row.each_with_index do |tile, col_i|

        tile.x = row_i
        tile.y = col_i


        if tile.type != TILE_OBSTACLE
          if row_i != (@matrix.size() - 1) and row_i != 0 # matrix all rows but last and first

            if col_i == (row.size() -1) # matrix last col
              tile.add_edge(tile.type,@matrix[row_i+1][col_i],true) # below
              tile.add_edge(tile.type,@matrix[row_i+1][col_i-1],true) # below diagonal
              tile.add_edge(tile.type,@matrix[row_i-1][col_i],true)# above
              tile.add_edge(tile.type,@matrix[row_i-1][col_i-1],true) # above diagonal
              tile.add_edge(tile.type,@matrix[row_i][col_i-1],true) # before


            elsif col_i == 0 # matrix first col
              tile.add_edge(tile.type,@matrix[row_i][col_i+1],true) # right after
              tile.add_edge(tile.type,@matrix[row_i+1][col_i],true)# below
              tile.add_edge(tile.type,@matrix[row_i+1][col_i+1],true)# below diagonal
              tile.add_edge(tile.type,@matrix[row_i-1][col_i],true) # above
              tile.add_edge(tile.type,@matrix[row_i-1][col_i+1],true)# above diagonal


            else #middle cols
              tile.add_edge(tile.type,@matrix[row_i][col_i+1],true)# right after
              tile.add_edge(tile.type,@matrix[row_i][col_i-1],true) # right before
              tile.add_edge(tile.type,@matrix[row_i+1][col_i],true)# below
              tile.add_edge(tile.type,@matrix[row_i+1][col_i+1],true)# below diagonal right
              tile.add_edge(tile.type,@matrix[row_i+1][col_i-1],true) # below diagonal left
              tile.add_edge(tile.type,@matrix[row_i-1][col_i],true)# above
              tile.add_edge(tile.type,@matrix[row_i-1][col_i+1],true) # above diagonal right
              tile.add_edge(tile.type,@matrix[row_i-1][col_i-1],true) # above diagonal left
            end


          elsif row_i == 0
            if col_i == (row.size() -1) #matrix last col
              tile.add_edge(tile.type,@matrix[row_i+1][col_i],true)  # below only
              tile.add_edge(tile.type,@matrix[row_i][col_i-1],true)  # before
              tile.add_edge(tile.type,@matrix[row_i+1][col_i-1],true)  # before diagonal

            elsif col_i == 0 # matrix first col
              tile.add_edge(tile.type,@matrix[row_i][col_i+1],true)  # right after
              tile.add_edge(tile.type,@matrix[row_i+1][col_i],true)  # below
              tile.add_edge(tile.type,@matrix[row_i+1][col_i+1],true)  # after diagonal

            else #middle cols
              tile.add_edge(tile.type,@matrix[row_i][col_i+1],true)  # right after
              tile.add_edge(tile.type,@matrix[row_i][col_i-1],true)  # right before
              tile.add_edge(tile.type,@matrix[row_i+1][col_i],true) # below
              tile.add_edge(tile.type,@matrix[row_i+1][col_i+1],true)  # diagonal right
              tile.add_edge(tile.type,@matrix[row_i+1][col_i-1],true)  # diagonal left
            end

          else # last row

            if col_i == (row.size() -1) #matrix last col
              tile.add_edge(tile.type,@matrix[row_i][col_i-1],true)  # before
              tile.add_edge(tile.type,@matrix[row_i-1][col_i],true)  # above
              tile.add_edge(tile.type,@matrix[row_i-1][col_i-1],true)  # above diagonal

            elsif col_i == 0 # matrix first col
              tile.add_edge(tile.type,@matrix[row_i][col_i+1],true)  # right after
              tile.add_edge(tile.type,@matrix[row_i-1][col_i],true)  # below
              tile.add_edge(tile.type,@matrix[row_i-1][col_i+1],true) # diagonal

            else #middle cols
              tile.add_edge(tile.type,@matrix[row_i][col_i+1],true)  # right after
              tile.add_edge(tile.type,@matrix[row_i][col_i-1],true)  # right before
              tile.add_edge(tile.type,@matrix[row_i-1][col_i],true)  # above
              tile.add_edge(tile.type,@matrix[row_i-1][col_i+1],true)  # diagonal right
              tile.add_edge(tile.type,@matrix[row_i-1][col_i-1],true)  # diagonal left
            end
          end
        end
          if tile
            @vertices << tile
          end


      end
    end

  end

  def walk_test(start = 0, finish = -1)
    start = @vertices[start]
    finish = @vertices[finish]

    Dijkstra.find_shortest_path(self, start, finish)


    path = Dijkstra.shortest_path_to_a

    puts "\nWalking ..."

    puts "Start: (#{start.x},#{start.y})"
    puts "Finish: (#{finish.x},#{finish.y})"

    print_matrix = []

    @matrix.each do |row|
      row_tmp = []
      row.each do |tile|
        row_tmp << (tile.value + " ")
      end
      print_matrix << row_tmp
    end

    path.each do |t|
      print_matrix[t.x][t.y] = "* "
    end

    print_matrix.each do |row|
      row.each do |tile|
        print tile
      end
      puts ""
    end

    puts ""

  end



end

