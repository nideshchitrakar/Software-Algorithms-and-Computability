class RainDrop {

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

  //void move(int stopPoint) {
  //  if (yPos <= stopPoint) yPos = yPos+speed; 
  //  else { 
  //    yPos = 0; 
  //    xPos = int(random(10, width - 10));
  //  }
  //}
  void move(int startPoint) {
    if (yPos > 0) yPos = yPos-speed; 
    else { 
      yPos = startPoint; 
      xPos = int(random(10, width - 10));
    }
  }
}