import java.util.*;

class Node implements Comparable<Node> {
  private String name;
  private float x;
  private float y;
  private int nodeRadius;
  
  private int minDistance = Integer.MAX_VALUE;
  public Node previous;
  private int distFromSource = Integer.MAX_VALUE;
  private boolean visited;
  private ArrayList<Edge> edges = new ArrayList<Edge>();
  
  public Node(String name, float x, float y, int nodeRadius) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.nodeRadius = nodeRadius;
  }
  
  public String toString() {
    return name;
  }
  
  public int compareTo(Node other) {
    return Integer.compare(minDistance, other.minDistance);
  }
  
  public int getRadius() {
    return nodeRadius;
  }
  
  public int getDistFromSource() {
    return distFromSource;
  }
  
  public void setDistFromSource(int distFromSource) {
    this.distFromSource = distFromSource;
  }
  
  public boolean isVisited() {
    return visited;
  }
  
  public void setVisited(boolean visited) {
    this.visited = visited;
  }
  
  public ArrayList<Edge> getEdges() {
    return edges;
  }
  
  public void addEdge(Edge edge) {
    edges.add(edge);
  }
  
  boolean collision(float x1, float y1) {
    if (x1 >= x - nodeRadius &&
      x1 <= x + nodeRadius &&
      y1 >= y - nodeRadius &&
      y1 <= y + nodeRadius) {
        return true;
      }
    return false;
  }
  
  void drawNode() {
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, nodeRadius, nodeRadius);
    fill(255);
    textSize(16);
    text(name, x - (nodeRadius/4), y + (nodeRadius/4));
  }
  
  void highlightNode() {
    fill(0,255,100);
    ellipse(x, y, nodeRadius + 10, nodeRadius + 10);
    drawNode();
  }
  
  void printCoords() {
    println("x: " + x + ", y: " + y);
  }
}