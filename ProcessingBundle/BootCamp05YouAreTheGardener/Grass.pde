class Grass {

  int xPos = 0;
  int yPos = height*2/3;
  int sWidth = width; // since this is an INNER CLASS, we can get the PApplet width and height
  int sHeight = height/3; // sprit width, not to be confused with PApple width;
  
  color gColor = color(0, 255,0);

  void draw() {

    fill(gColor); 
    rect(xPos, yPos, sWidth, sHeight);
  }
}