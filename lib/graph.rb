
class Graph

  def initialize()
    @vertices = []
  end

  def add_vertices(*args)
    args.each do |v|
      @vertices << v
    end
  end

  def add_vertice(v)
    if v
      @vertices.push(v)
    end
  end

  def vertices
    @vertices
  end

  def print_as_adj_list
    @vertices.each do |v|
      puts "Vertex #{v.value}"
      puts "Adjacency List:"
      v.adjacents.each do |a|
        puts "#{a.value}"
      end
      puts "\n"
    end
  end

end

