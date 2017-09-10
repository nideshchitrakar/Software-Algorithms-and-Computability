/* Illustrates how top put text on the display and keep track of a score.
 
 Also illustrates scorekeeping.  All on this page!
 
 BootCamp Processing is developed by Ursula Wolz for Riversound Solutions
 Please attribute if you remix.
 */


Grass plainGrass;  
Gardener pinky;  
Flower redFl;   
Flower redFl2;
Vase theVase;
RainDrop [] drops = new RainDrop[10];

int score = 20;


void setup() {  
  size(600, 400);  
  plainGrass = new Grass();

  pinky = new Gardener();
  pinky.xPos = 10;
  pinky.yPos = plainGrass.yPos - pinky.sHeight;
  for (int i = 0; i < drops.length; i++) 
    //drops[i] = new RainDrop(10, 0); //((int)random(width), -(int)random(height));
    drops[i] = new RainDrop((int)random(width), -(int)random(height));


  redFl = new Flower();
  redFl2 = new Flower();
  redFl2.xPos = redFl.xPos - redFl2.sWidth +5;
  redFl2.yPos = redFl.yPos - 5;

  theVase = new Vase();
  theVase.xPos = redFl2.xPos;
  theVase.yPos = redFl2.yPos + 45;

  pinky.rightBoundary = theVase.xPos - pinky.sWidth;
}

void draw() {
  background(#BCEAF2);
  plainGrass.draw();   
  theVase.draw();
  redFl.draw();
  redFl2.draw();
  pinky.draw();

  for (RainDrop aDrop : drops) {
    aDrop.draw();

    aDrop.move(height*2/3);
    if (aDrop.touching(pinky)) {
      pinky.turnBluer();
      
      /* THIS IS NOEW,  WHAT DOES IT MEAN */
      score -=  1;
      aDrop.xPos = (int)random(width);
      aDrop.yPos = -(int)random(height);
    }
    
    /* THIS IS HOW TEXT IS DISPLAYED STUDY IT! */
    fill(0);
    text("Score: " + score, 10, 25);
  }
  if (score <= 0) {
    clear();
    textSize(32);
    fill(255, 255, 255);
    text("GAME OVER", width/2, height/2);
    noLoop();
  }
}
void keyPressed() {

  switch (keyCode) {

  case RIGHT : 
    pinky.moveRight(); 
    break;

  case LEFT: 
    pinky.moveLeft(); 
    break;
  }
}

/* Suggestion:
    Game over takes a LONG TIME.  Fix it so that it goes quickly but not too quickly.
    Coordinate score (wet level) with blueness of the gardener.
    When the game is over, change the background entirely, and just display GAME OVER in very large letters
    */