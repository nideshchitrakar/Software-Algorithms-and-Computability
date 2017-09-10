/*   Illustrates simple collision.
     There is a lot here:
     
       Bounding boxes
       Breaking a problem into readable pieces
       Logical AND and OR (&& and || respectively)
       BTW:  ! means NOT
       
       How to simplify code to make debuggin easier. (The rnadom position of the raindop 
         has been turned off.
    
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

  aDrop.move(height*2/3);
  if (aDrop.touching(pinky)) { 
    pinky.turnBluer();
    aDrop.yPos = 0;
    aDrop.xPos = (int)random(width);
  }
 
}

void keyPressed() {
  println(keyCode);
  switch (keyCode) {
  case RIGHT : 
    pinky.moveRight(); 
    break;

  case LEFT: 
    pinky.moveLeft(); 
    break;
  }
}

/* Suggestions:
   Really dig through the collision code to see how it works.
   Eventually fix the raindrop so that it is random again.
*/

