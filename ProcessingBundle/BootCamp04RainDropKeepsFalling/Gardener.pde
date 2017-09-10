class Gardener {
  int xPos;
  int yPos;
  int sWidth;  
  int sHeight; 
  
  int speed = 1;
  int scale; 
  color gColor = color(255, 0, 255);
  color eyeColor = 0;
  

  Gardener() { 
    xPos = 0;
    yPos = 0;

    scale = 5;
    sWidth = 6*scale;
    sHeight = 10*scale;
  }

  void draw() {  
    fill(gColor);
    ellipseMode(CORNER);
    ellipse(xPos, yPos+2*scale, sWidth, 8*scale);
    ellipse(xPos, yPos, sWidth, 4*scale);
    fill(eyeColor);
    ellipse(xPos+4*scale, yPos+2*scale, 5, 5);
  }

  void move(int stopPoint) {
    if (xPos <= stopPoint) xPos = xPos+speed;
  }
}


