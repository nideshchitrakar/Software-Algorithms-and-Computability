class Flower {

  PImage thisFlower;  
  int xPos;
  int yPos;
  int sHeight; 
  int sWidth;
  
  int speed = 5;
  int leftBoundary = 0;
  int rightBoundary = width;

  Flower() { 
    // Loads the image
    thisFlower = loadImage("red flower.png");
    sHeight = thisFlower.height; // Derive height from the image;
    sWidth = thisFlower.width; // Derive width from the image;
    xPos = width-30;
    yPos = (2*height/3) - sHeight;
  }
  
  void draw() {
    imageMode(CORNER);
    image(thisFlower, xPos, yPos);
  }
  
  void moveRight() {
    if (xPos <= rightBoundary - sWidth) xPos = xPos+speed;
  }

  void moveLeft() {
    if (xPos >= leftBoundary) xPos = xPos-speed;
  }
}