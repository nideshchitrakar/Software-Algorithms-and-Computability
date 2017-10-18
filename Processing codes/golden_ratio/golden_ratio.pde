float phi = (sqrt(5) + 1) * 0.5;
float x = 500;
float y = 500;

void setup() {
  size(809,500);
  background(0);
  
  stroke(255);
  noFill();
  for (int i = 0; i < 5; i++) {
    rect(0,0,x,y);
    //translate(x, 0);
    switch(i) {
      case 0:
        translate(x, 0);
        break;
      case 1:
        translate(x * (1 - (phi - 1)), y);
        break;
      case 2:
        translate(- x * (phi - 1), x - x * (phi - 1));
        break;
      case 3:
        translate(0, - x * (phi - 1));
        break;
    }
    x = x/phi;
    y = y/phi;
  }
}

void draw() {
}