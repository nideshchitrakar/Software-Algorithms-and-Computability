public class Edge {
  private Node from;
  private Node to;
  private int weight;
  
  public Edge(Node from, Node to, int weight) {
    this.from = from;
    this.to = to;
    this.weight = weight;
  }
  
  public Node getFromNode() {
    return from;
  }
  
  public Node getToNode() {
    return to;
  }
  
  public int getWeight() {
    return weight;
  }
  
  public Node getNeighbor(Node node) {
    if (this.from == node) {
      return this.to;
    }
    else return this.from;
  }
  
  public void drawEdge() {
    stroke(255,255,0);
    if (weight > 10) weight = 10;
    if (weight < 1) weight = 1;
    strokeWeight(weight);
    line(from.x, from.y, to.x, to.y);
    textSize(18);
    fill(0,0,255);
    text(weight - 1, ((from.x + to.x) / 2) - 2, ((from.y + to.y) / 2) + 2);
    textSize(14);
    fill(255); //green = 0, 255, 100
    text(weight - 1, ((from.x + to.x) / 2), ((from.y + to.y) / 2));
  }
  
  public void highlightEdge() {
    fill(0,255,100);
    strokeWeight(weight + 10);
    line(from.x, from.y, to.x, to.y);
    drawEdge();
  }
}