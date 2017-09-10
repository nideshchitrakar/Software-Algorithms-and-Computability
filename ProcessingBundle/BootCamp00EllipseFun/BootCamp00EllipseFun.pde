/* Illustrates the basic setup/draw structure of a processing program.
   These are METHODS that you are defining.  They are executed
   by a CONTROL LOOP in the background.
   
   Each definition contains methods to be EXECUTED, for exmaple
   size, fill, ellipseMode etc.  Figure out what these do by
   running the code and changing the PARAMETERS.
   
   (Parameters are the nubmers that appear inside the parenthesis)
   
   BootCamp Processing is developed by Ursula Wolz for Riversound Solutions
   Please attribute if you remix.
*/


void setup() {
  size(600, 400);
}
void draw() {

  fill(255, 0, 255);
  ellipseMode(CORNER); 
  ellipse(300, 210, 30, 40);
  ellipse(300, 200, 30, 20);
  fill(0);
  ellipse(320, 210, 5, 5);
}

/* Try it:
   What happens if you reorder the ellipse commands?
   What happens if you comment out the ellipseMode?
   
*/

 
