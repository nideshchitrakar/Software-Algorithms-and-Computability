/*  Illustrates simple movement by allowing draw() to loop.
    By redrawing the background each time, the entire window is redrawn each time through the loop.

    Each object defines a move() method that may or may not include an x position (horizontal position) where
    the object should stop.
    
   BootCamp Processing is developed by Ursula Wolz for Riversound Solutions
   Please attribute if you remix.

 */


Grass plainGrass;  
Gardener pinky;  
Flower redFl;   
Flower redFl2;
Vase theVase;


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

  // Looping by default!
}

void draw() {
  background(#BCEAF2);
  plainGrass.draw();   
  theVase.draw();
  redFl.draw();
  redFl2.draw();
  pinky.draw();

  pinky.move(theVase.xPos - pinky.sWidth); // stop moving when you get to the vase;
}

/* What happens if you don't include the background refresh?
   How can you make the gardener go faster or slower?
   In the move() method, when the stopPoint is reached, 
    does the program actually stop looping or does the gardener simply not move anymore?
 */
