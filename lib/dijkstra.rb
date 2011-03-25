class Dijkstra

  Inf = 99999

  def Dijkstra.find_shortest_path(graph, start, finish)

    @@distance = {}
    @@previous = {}
    @@target = finish
    @@q = graph.vertices.clone

    total_distance = 0

    graph.vertices.each do |vertex|
        @@distance[vertex] = Inf
        @@previous[vertex] = nil
    end
    @@distance[start] = 0

    while @@q.size > 0
      u = extract_min

      if @@distance[u] == Inf
        break
      end

      @@q.delete(u)

      u.adjacents.each do |v|
        total_distance = @@distance[u] + u.get_weight_adjacent(v)

        if total_distance < @@distance[v]
          @@distance[v] = total_distance
          @@previous[v] = u
        end
      end
    end

  end

  def Dijkstra.dump_distances(graph)
    puts "Shortest paths:"

    graph.vertices.each do |vertex|
      puts "Distance from #{start.value} to #{vertex.value} is #{@@distance[vertex]}"
    end

  end

  def Dijkstra.shortest_path_to_a

    path = []
    u = @@target
    while u
      path.insert(0,u)
      u = @@previous[u]
    end
    path

  end

  def Dijkstra.dump_path(path)

    puts "Path:"
    path.each do |v|
      puts "#{v.value} - distance #{@@distance[v]} km"
    end

  end

  def Dijkstra.extract_min

    min = Inf
    min_vertex = nil

    @@q.each do |vertex|
      if @@distance[vertex] < min
        min = @@distance[vertex]
        min_vertex = vertex
      end
    end

    min_vertex
  end
end

