
class Vertex

  def initialize(value=nil)
    @value = value
    @edges = []
    @adjacents = []
    @single_adjacents = [];
  end

  def add_edge(weight, vertex, directed=false)

    if directed == false
      @edges << Edge.new(weight, vertex, self, directed)
    end
    @edges << Edge.new(weight, self, vertex, directed)
  end

  def single_adjacents
     @single_adjacents = []
     self.edges.each do |e|
      v1 = e.vertices[0]
      v2 = e.vertices[1]

      if v1 == self
        if !@single_adjacents.include? v2
          @single_adjacents << v2
        end
      else
        if !@single_adjacents.include? v1
          @single_adjacents << v1
        end
      end
    end
    @single_adjacents
  end

  def adjacents
    @adjacents = []
    self.edges.each do |e|

      v1 = e.vertices[0]
      v2 = e.vertices[1]

      if v1 == self
        @adjacents << v2
      else
        @adjacents << v1
      end
    end
    @adjacents
  end

  def get_weight_adjacent(vertex)

    self.edges.each do |e|
      v1 = e.vertices[0]
      v2 = e.vertices[1]

      if v1 == vertex or v2 == vertex
        return e.weight
      end
    end

  end

  def edges
    @edges
  end

  def value
    @value
  end

end

