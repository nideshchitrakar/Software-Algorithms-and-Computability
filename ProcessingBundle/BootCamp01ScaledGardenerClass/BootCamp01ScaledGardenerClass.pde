/* Illustrates a simple subclass.  Click on the tab "Gardener'
   to see how a class definition is written in Processing.  
   Technically this is an INNER CLASS of Java.
   
   In the definition of setup, the VARIABLE pinky is a NEW gardener.
   Attributes of an object like pinky can modified using DOT notation.
   Experiment with this code to see what everything does.

   BootCamp Processing is developed by Ursula Wolz for Riversound Solutions
   Please attribute if you remix.
*/

Gardener pinky;
Gardener sam;

void setup() {
  size(600, 400); //  This has to come first so that pinky can be drawn relative to the width and height!
  pinky  = new Gardener();
  pinky.xPos = width/2;
  pinky.yPos = height/2;
  
  sam = new Gardener();
  sam.xPos = width/4;
  sam.yPos = height/2;
}

void draw() {
  pinky.draw();
  sam.draw();
}

/* Suggestion:  try adding another gardener called 'sam'.  
   If you can do that you 'get' object instantion!
   But don't worry if you don't, you will eventually.
   */
   