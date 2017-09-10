class RainDrop {

  /* 
   NOTICE THAT THE RAINDROP REMAINS IN ONE PLACE.
   This is so you can really see how the raindrop interacts with the gardener.
   Locate the line in Move and see the sweet trick used to control the code
   for debugging purposes. Got back to #5 to see what was there before.
   */

  PImage aDrop;   // This declares that a RedFlower will need a PImage;
  int xPos;
  int yPos;
  int sHeight; 
  int sWidth;

  int speed = 2;


  RainDrop(int x, int y) { 
    xPos = x;
    yPos = y;
    aDrop = loadImage("rain drop.png");
    aDrop.resize(0, aDrop.height/2);
    sWidth = aDrop.width;
    sHeight = aDrop.height;
  }

  void draw() {
    image(aDrop, xPos, yPos);
  }


  void move(int stopPoint) {
    if (yPos <= stopPoint) yPos = yPos+speed; 
    else { 
      yPos = 0; 
      //xPos =  10; // int(random(10, width - 10));
      xPos = int(random(10, width - 10));
    }
  }


/* These attributes are needed to calculate the BOUNDING BOX on the sprites
*/
  int top;
  int bottom;
  int left;
  int right;

// OK, you don't really need to do this but it makes the code so much easier to read.
  void defineBoundaries() {
    top = yPos;
    bottom = yPos + sHeight;
    left = xPos;
    right = xPos + sWidth;
  }

  /* This is expanded out so you can understand the logic
     A raindrop is touching a gardener when there is 
     both horizontal and vertical overlap of the bounding boxes. */
  Boolean touching(Gardener g) {
    defineBoundaries();
    g.defineBoundaries();
    return horizontalOverlap(g) && verticalOverlap(g);
  }
  
  /* There are three cases for when there is horizontal overlap.
     1) When the gardener's top is between the raindrop's top and bottom.
     OR   ( || means logical OR)
     2) When the gardener's bottom is between the raindrop's top and bottom.
     OR
     3) when the raindrops top and botoom are both "inside" the gardener.
        && means logical AND
        */
        
  Boolean horizontalOverlap(Gardener g) {
    return between(top, g.top, bottom) || 
           between(top, g.bottom, bottom) ||
           (g.top < top && g.bottom > bottom);
  }
  
  /* Same cases, but on the horizontal rather than vertical */
  Boolean verticalOverlap(Gardener g) {
    return between(left, g.left, right) ||
           between(left, g.right, right) ||
           (g.left < left && g.right > right);
  }

 /* Again this is just for readability. */
  boolean between(int a, int b, int c) {
    return (a <= b && b <= c);
  }
}