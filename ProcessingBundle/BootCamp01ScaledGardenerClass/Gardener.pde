/*  Needs:
 One that is just generic.  You are going to cheat and reverse engineer this one. :-)
 */

class Gardener {
  int xPos;
  int yPos;
  int sWidth;  // sprit width, not to be confused with PApple width;
  int sHeight; // sprite height not to be confused with PApple height
  int scale; 
  color gColor = color(255, 0, 255);
  color eyeColor = 0;

  Gardener() { // // This is a constructor. It is the method that is called when you say Gardener pinky = new Gardener();
    // This defines the DEFAULT Gargener
    xPos = 0;
    yPos = 0;

    scale = 20;
    sWidth = 6*scale;
    sHeight = 10*scale;
  }

  void draw() {  // This is the Gardener's draw method used above as pinky.draw() 
    // rect(xPos,yPos,sWidth,sHeight);
    fill(gColor);
    ellipseMode(CORNER);
    ellipse(xPos, yPos+2*scale, sWidth, 8*scale);
    ellipse(xPos, yPos, sWidth, 4*scale);
    fill(eyeColor);
    //ellipse(xPos+4*scale, yPos+2*scale, 5, 5); //unscaled
    ellipse(xPos+4*scale, yPos+2*scale, scale, scale); //scaled
  }
}

/* Fit it project:  the eye is not scaled... Scale the eye.
 Does it look better with an outline.
 */