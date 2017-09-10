class Vase {

  /*  This class shows you how to manipulate a bitmap image using a Processing PImage.
   
   */

  PImage aVase;  


  int xPos = 0;
  int yPos = 0;
  int sHeight; 
  int sWidth;

  Vase() { 
    aVase = loadImage("Vase.png");
    // If one argument to resize is 0, then it is sized proportionally.
    aVase.resize(0, aVase.height/2); // Because the original is to big.
    sHeight = aVase.height;
    sWidth = aVase.width;
  }
  void draw() {
    image(aVase, xPos, yPos);
  }
}