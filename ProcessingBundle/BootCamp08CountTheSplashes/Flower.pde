class Flower {


  PImage thisFlower;   
  int xPos;
  int yPos;
  int sHeight; 
  int sWidth;

  
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
    // draw the PImage thisFlower with its upper left corner at 40 pixels left of the right side, andline.
    image(thisFlower, xPos, yPos);
  }
}

