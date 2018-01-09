import java.util.*;

public class Graph {
  public Edge[] edges;
  private int numEdges;
  public Node[] nodes;
  private int numNodes;
  
  public Graph(Edge[] edges, Node[] nodes) {
    this.edges = edges;
    this.nodes = nodes;
    this.numEdges = edges.length;
    this.numNodes = nodes.length;
  }
  
  public Edge[] getEdges() {
    return edges;
  }
  
  public Node[] getNodes() {
    return nodes;
  }
  
  public int getNumNodes() {
    return numNodes;
  }
  
  public int size() {
    return edges.length;
  }
}