/*  Illustrates how an array of objects can be used to create many (many!) instances of a class.

   There is a lot going on in this example as well, but this is the true power of objects.
   Once you've defined a class you can create huge numbers of them if you keep them
   anonymous in an array. 
   
   To ITERATE through an array, Java (and C) hang with tradition and use a FOR LOOP.
   Other languages have more polite constructs. 
   
   Best to just read the code and play play play play.
   
   Other things to look out for.
     1) The raindrop does a cheap trick so that they all don't line up.  Find it.
     2) Pinky turn blue has it gets wet.  How?
    
   BootCamp Processing is developed by Ursula Wolz for Riversound Solutions
   Please attribute if you remix.
 */

/* In a java program you separate out your DATA from your METHODS */

/* These objects are data that is manipulated by the program.
 They are defined here so that they can be used in both methods */
Grass plainGrass;  
Gardener pinky;  
Flower redFl;   
Flower redFl2;
Vase theVase;

/* This says create an ARRAY of raindrops and make enough space for 10 of them.
   Yes, we agree, this is a crazy way to say that.
   */
   
RainDrop [] drops = new RainDrop[10];

/* This is the setup method that gets executed exaclty once. */
void setup() {  
  size(600, 400);  
  plainGrass = new Grass();

  pinky = new Gardener();
  pinky.xPos = 10;
  pinky.yPos = plainGrass.yPos - pinky.sHeight;
  
  /* This say for each space in the array, create a new raindrop.
     More detailed:  Start an interator (counter) called i at 0,
     So long as i is less than the number of spaces in the array,
     create a new one.  Add 1 to the i each time through the loop.
     Yes. we know this is icky.  Eventually you just read it it.
  */
  
  /* Spoiler!  Look carefully at where each raindrop starts! */
  for (int i = 0; i < drops.length; i++) 
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

/* This is a DIFFERENT KIND OF FOR LOOP!
   It says "for each Raindrop in the array drops, refer to it as aDrop
   and do what follows
   */
   
   /* Another spoiler alert:  look carefully at what is happening to pinky! */
  for (RainDrop aDrop : drops) {
    aDrop.draw();

    aDrop.move(height*2/3);
    if (aDrop.touching(pinky)) {
      pinky.turnBluer();
      aDrop.yPos = - height;
      aDrop.xPos = (int)random(width);
    }
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

/* Suggestions:
      Play with the loops.  Try to make them break.
      In particular, play around with the values of i.
      Why do you think we start at 0?
      */
      
