class Gardener {
  int xPos;
  int yPos;
  int sWidth;  // sprit width, not to be confused with PApple width;
  int sHeight; // sprite height not to be confused with PApple height
  int speed = 3;
  int leftBoundary = 0;
  int rightBoundary = width;

  int scale; 
  color gColor = color(255, 0, 255);
  color eyeColor = 0;
  int changeColor = 5;

  int top;
  int bottom;
  int left;
  int right;



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


  void moveRight() {
    if (xPos <= rightBoundary) xPos = xPos+speed;
  }

  void moveLeft() {
    if (xPos >= leftBoundary) xPos = xPos-speed;
  }

  void turnBluer() {
    println(red(gColor));
    gColor = color(red(gColor) - changeColor, green(gColor), blue(gColor));
  }


  void defineBoundaries() {
    top = yPos;
    bottom = yPos + sHeight;
    left = xPos;
    right = xPos + sWidth;
  }
}

