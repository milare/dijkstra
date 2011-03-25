class Edge

  def initialize(weight=nil, v1=nil, v2=nil, directed=false)
    @directed = directed
    @weight = weight
    @v1 = v1
    @v2 = v2
  end

  def vertices
    [@v1,@v2]
  end

  def weight
    @weight
  end

  def is_directed?
    @directed
  end

end

