/*  Illustrates how to store data to and retreive it from a TABLE!
    (Why use tables?  Because they are the most complext and easiest to relate to.)
    
    There are two new classes:
    1) HighScoreManager is responsible for retreiving the most recent high score from the database.
    2) Timer uses the built in time methods to set and reset a timer.
    
    See more comments in that code.

   BootCamp Processing is developed by Ursula Wolz for Riversound Solutions
   Please attribute if you remix.

 */


Grass plainGrass;  
Gardener pinky;  
Flower redFl;   
Flower redFl2;
Vase theVase;
RainDrop [] drops = new RainDrop[10];
HighScoreManager hsm;
Timer t = new Timer();

int score = 5;

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

  hsm = new HighScoreManager();
  println( hsm.highScore);
 

  // Looping by default!
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
      score -=  1;
      aDrop.xPos = (int)random(width);
      aDrop.yPos = -(int)random(height);
    }
    fill(0);
    text("Score: " + score + " Time: " + t.show(), 10, 25);
    text("High score: " + hsm.highScore, 10,50);
  }
  if (score <= 0) {
    hsm.updateHighScore(int(t.show()));
    background(255);
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

/* Time for you to make it your own! */