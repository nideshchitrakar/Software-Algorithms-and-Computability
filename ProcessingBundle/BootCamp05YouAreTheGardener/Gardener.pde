class Gardener {
  int xPos;
  int yPos;
  int sWidth;  
  int sHeight; 

    int speed = 3;
  int leftBoundary = 0;
  int rightBoundary = width;

  int scale; 
  color gColor = color(255, 0, 255);
  color eyeColor = 0;
  
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
      ellipse(xPos+4*scale, yPos+2*scale, 5, 5);
    }
    else
    {
      ellipse(xPos+1*scale, yPos+2*scale, 5, 5);
    }
  }

/* Check these out! */
  void moveRight() {
    if (xPos <= rightBoundary) xPos = xPos+speed;
    isLeft = false;
  }

  void moveLeft() {
    if (xPos >= leftBoundary)
    {
      xPos = xPos-speed;
      isLeft = true;
    }
  }
}

/* Fix it:
 Pinky should face the other way when going left
 */