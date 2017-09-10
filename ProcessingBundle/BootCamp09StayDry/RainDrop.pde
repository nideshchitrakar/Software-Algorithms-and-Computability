class RainDrop {

 
  PImage aDrop;   
  int xPos;
  int yPos;
  int sHeight; 
  int sWidth;

  int speed = 1;

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
      xPos = int(random(10, width - 10));
    }
  }



  int top;
  int bottom;
  int left;
  int right;

  void defineBoundaries() {
    top = yPos;
    bottom = yPos + sHeight;
    left = xPos;
    right = xPos + sWidth;
  }

  /* This is expanded out so you can understand the logic */
  Boolean touching(Gardener g) {
    defineBoundaries();
    // rect(left,top,right - left, bottom - top);
    // rect(g.left,g.top,g.right - g.left,g.bottom - g.top);
    g.defineBoundaries();
    return horizontalOverlap(g) && verticalOverlap(g);
  }



  Boolean horizontalOverlap(Gardener g) {
    return between(top, g.top, bottom) || 
      between(top, g.bottom, bottom) ||
      (g.top < top && g.bottom > bottom);
  }

  Boolean verticalOverlap(Gardener g) {
    return between(left, g.left, right) ||
      between(left, g.right, right) ||
      (g.left < left && g.right > right);
  }



  boolean between(int a, int b, int c) {
    return (a <= b && b <= c);
  }
}