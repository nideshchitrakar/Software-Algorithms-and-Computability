class Gardener {
  int xPos;
  int yPos;
  int sWidth;  // sprit width, not to be confused with PApple width;
  int sHeight; // sprite height not to be confused with PApple height
  int speed = 5;
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
  
  boolean isLeft = false;
  
  

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
    if (!isLeft) {
      ellipse(xPos+4*scale, yPos+2*scale, scale, scale);
    } else {
      ellipse(xPos+1*scale, yPos+2*scale, scale, scale);
    }
  }


  void moveRight() {
    if (xPos <= rightBoundary) xPos = xPos+speed;
    isLeft = false;
  }

  void moveLeft() {
    if (xPos >= leftBoundary) xPos = xPos-speed;
    isLeft = true;
  }

  void defineBoundaries() {
    top = yPos;
    bottom = yPos + sHeight;
    left = xPos;
    right = xPos + sWidth;
  }
  
  void turnBluer() {
   println(red(gColor));
   scale += 1;
   sWidth = 6*scale;
   sHeight = 10*scale;
   gColor = color(red(gColor) - changeColor ,green(gColor),blue(gColor));
  }
}

/* Fix it:
 Pinky should face the other way when going left
 */