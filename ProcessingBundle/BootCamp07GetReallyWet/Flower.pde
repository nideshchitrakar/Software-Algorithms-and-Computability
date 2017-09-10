class Flower {

  /*  This class shows you how to manipulate a bitmap image using a Processing PImage.
   
   It also shows how to define class attributes (also called properties or fields)
   
   */

  PImage thisFlower;   // This declares that a the variable thisFlower will be of type PImage;

  int xPos;
  int yPos;
  int sHeight; 
  int sWidth;

  // This is a constructor. It is the method that is called when you say Flower f = new Flower();
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

