int r = 0;
float x1 = 0;
float y1 = 0;
float f = TWO_PI * (sqrt(5) + 1) * 0.5;  // golden ratio
  
public void setup() {
  int x = int(500*f);
  //println(x);
  size(809,500);
  background(0);
}

public void draw() {
  //background(0);
  translate(width*0.5, height*0.5);
  stroke(255);
  float x2 = cos(f*r)*r;
  float y2 = sin(f*r)*r;
  point(x2,y2);
  //line(x1, y1, x2, y2);
  r++;
  x1 = x2;
  y1 = y2;
  //delay(10);
}