import java.util.*;

//Node n1 = new Node(100,100,20);
HashSet<Node> nodes = new HashSet<Node>();
ArrayList<Edge> edges = new ArrayList<Edge>();
String mode = "draw vertex";
int selected = 0;
ArrayList<Node> selection = new ArrayList<Node>();
ArrayList<Node> highlightNodes = new ArrayList<Node>();
ArrayList<Edge> highlightEdges = new ArrayList<Edge>();
int weight = 0;
int nodeName = 1;

void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  background(0);
  textSize(14);
  fill(255);
  text("1. Click on the canvas to plot nodes. Press RIGHT when done.", 10, 20);
  text("2. Click to select two nodes you wish to connect with an edge.", 10, 40);
  text("3. Press LEFT to go back to plotting nodes if needed. Then follow step 2.", 10, 60);
  text("4. Press UP. This will create the edge with that weight.", 10, 80);
  text("5. Follow steps 2-5 until you have your connected graph.", 10, 100);
  text("6. Choose a node to be the starting node A. Choose an end node B too.", 10, 120);
  text("7. When you are done, press SHIFT to generate the shortest path between A and B.", 10, 140);

  for (Edge e: edges) {
    e.drawEdge();
  }
  for (Node s: selection) {
    fill(255,255,0);
    ellipse(s.x, s.y, s.getRadius() + 5, s.getRadius() + 5);
  }
  for (Node n: nodes) {
    n.drawNode();
  }
  
  if (mode == "generate path") {
    highlightPath(generatePath());
  }
  
}

void mouseClicked() {
  if (mode == "draw vertex") {
    Node node = new Node(String.valueOf(nodeName),mouseX,mouseY,20);
    nodes.add(node);
    node.drawNode();
    nodeName += 1;
    delay(1);
  }
  else if (mode == "select nodes") {
    for (Node n:nodes) {
      if (n.collision(mouseX,mouseY)) {
        if (!selection.contains(n)) {
          n.printCoords();
          if (selected < 2) {
            fill(255,255,0);
            ellipse(n.x, n.y, n.getRadius() + 5, n.getRadius() + 5);
            n.drawNode();
            selection.add(n);
            println("selection : " + selection); 
            selected += 1;
          }
        }
        else {
          n.printCoords();
          fill(0);
          ellipse(n.x, n.y, n.getRadius() + 5, n.getRadius() + 5);
          n.drawNode();
          selection.remove(n);
          selected -= 1;
        }
      }
    }
  }
}

void drawEdge() {
  try {
        Edge edge = new Edge(selection.get(0), selection.get(1), weight + 1);
        selection.get(0).addEdge(edge);
        selection.get(1).addEdge(edge);
        edge.drawEdge();
        println("drew edge");
        edges.add(edge);
        selection.get(0).drawNode();
        selection.get(1).drawNode();
        fill(0);
        Node n1 = selection.get(0);
        Node n2 = selection.get(1);
        ellipse(n1.x, n1.y, n1.getRadius() + 5, n1.getRadius() + 5);
        ellipse(n2.x, n2.y, n2.getRadius() + 5, n2.getRadius() + 5);
        n1.drawNode();
        n2.drawNode();
        selection.clear();
        selected -= 2;
        //println("edges: " + edges);
      }
      catch (Exception e) {
        println("no nodes selected");
      }
    
    mode = "select nodes";
    println("swtiching mode to select nodes");
}

List<Node> generatePath() {
  DijkstrasAlgorithm da = new DijkstrasAlgorithm();
  da.computePaths(selection.get(0));
  println("distance to " + selection.get(1) + ": " + selection.get(1).minDistance);
  List<Node> path = da.getShortestPathTo(selection.get(1));
  println("path: " + path);
  highlightPath(path);
  return path;
}

void highlightPath(List<Node> path) {
  ////Collections.reverse(path);
  //for (int i = 0; i < path.size(); i++) {
  //  //path.get(i).highlightNode();
  //  for (Edge e:path.get(i).getEdges()) {
  //    if (e.getToNode() == path.get(i+1)) {
  //      e.highlightEdge();
  //      path.get(i).highlightNode();
  //    }
  //  }
  //}
  for (Node n: path) {
    n.highlightNode();
  }
}

void keyPressed() {
  switch (keyCode) {
    case RIGHT:
      mode = "select nodes";
      println("switching mode to select nodes");
      break;
    case LEFT:
      mode = "draw vertex";
      println("switching mode to draw vertex");
      break;
    case UP:
      mode = "draw edge";
      println("switching mode to draw edge");
      drawEdge();
      break;
    case DOWN:
      break;
    case SHIFT:
      mode = "generate path";
      println("switching mode to generating shortest path");
      generatePath();
      break;
    default:
      break;
  }
  int n = int(key); // int('0') = 48
  weight = n - 48;
  println("weight = " + weight);
}