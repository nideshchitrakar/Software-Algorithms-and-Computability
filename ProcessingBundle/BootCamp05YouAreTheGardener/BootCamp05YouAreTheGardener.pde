/*  Illustrates keyboard controlled movement.  Scroll down to the bottom of this file.
    
   BootCamp Processing is developed by Ursula Wolz for Riversound Solutions
   Please attribute if you remix.
 
 */

Grass plainGrass;  
Gardener pinky;  
Flower redFl;   
Flower redFl2;
Vase theVase;
RainDrop aDrop;


void setup() {  
  size(600, 400);  
  plainGrass = new Grass();
  
  pinky = new Gardener();
  pinky.xPos = 10;
  pinky.yPos = plainGrass.yPos - pinky.sHeight;

  redFl = new Flower();
  redFl2 = new Flower();
  redFl2.xPos = redFl.xPos - redFl2.sWidth +5;
  redFl2.yPos = redFl.yPos - 5;

  theVase = new Vase();
  theVase.xPos = redFl2.xPos;
  theVase.yPos = redFl2.yPos + 45;

  aDrop = new RainDrop(theVase.xPos, 0);
  
  pinky.rightBoundary = theVase.xPos - pinky.sWidth;
}

void draw() {
  background(#BCEAF2);
  plainGrass.draw();  
  theVase.draw();
  redFl.draw();
  redFl2.draw();
  pinky.draw();
  aDrop.draw();

  aDrop.move(height*9/10);
}

/* This is new!  
   keyPressed is a method of a PApplet that you OVERRIDE, which means you redefine it.
   In a PAppet, the keyPressed method is called when a keyboard EVENT happens.
   
   This also introduces the SWITCH statement.  
   Check it out in the referenes (under the Help pull down menu
   */
   
void keyPressed() {

  switch (keyCode) {  // based on the key code of the key pressed:
  case RIGHT :   //  in case it was the "RIGHT' key
    pinky.moveRight(); // use the moveRight() method.
    break; // break out of the switch statement, don't keep checking for others.

  case LEFT: 
    pinky.moveLeft(); 
    break;
  
  case DOWN:
    redFl.moveLeft();
    break;
    
  case UP:
    redFl.moveRight();
    break;
  }
}

/*  Enhancements are up to you! 
    Change which keys control the gardener's movement.
    Silly things to try:
        Have other keys control how a flower moves.
        Have raindrops that rise to the sky
        */
/*
    I have made the UP and DOWN arrow keys to move one of the
    flowers and also reversed the direction of the rain drops.
    Also made the gardener face left when user presses the left button.
*/