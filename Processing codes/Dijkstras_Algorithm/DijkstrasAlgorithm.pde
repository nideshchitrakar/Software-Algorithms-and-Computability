import java.util.*;

public class DijkstrasAlgorithm {
  public List<Edge> edges;
  
  public void computePaths(Node source) {
    source.minDistance = 0;
    PriorityQueue<Node> nodeQueue = new PriorityQueue<Node>();
    nodeQueue.add(source);
    
    while (!nodeQueue.isEmpty()) {
      Node u = nodeQueue.poll();
      
      for (Edge e:u.edges) {
        Node v = e.to;
        if (e.to == u) {
          v = e.from;
        }
        int weight = e.weight;
        
        int distanceThruU = u.minDistance + weight;
         
        if (distanceThruU < v.minDistance) {
          nodeQueue.remove(v);
          v.minDistance = distanceThruU;
          v.previous = u;
          nodeQueue.add(v);
        }
      }
    }
  }
  
  public List<Node> getShortestPathTo(Node target) {
    List<Node> path = new ArrayList<Node>();
    for (Node node = target; node != null; node = node.previous) {
      path.add(node);
    }
    Collections.reverse(path);
    return path;
  }
}