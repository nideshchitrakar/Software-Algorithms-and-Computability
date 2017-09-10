/*  Illustrates multiple class definitions and using IMAGES! rather than vector graphics.

    The flower is a bitmap image loaded from a file.  The file resides in the DATA folder.
    Use your operating system to take a look at that file. Note that you have to get the
    name of the file exactly right.  The name is a STRING of characters and has to appear inside
    double quotes ""
    
   BootCamp Processing is developed by Ursula Wolz for Riversound Solutions
   Please attribute if you remix.

  */
  
Grass plainGrass;   // Creates some plain grass
Gardener pinky;  // Creates a gardener called 'pinky'
Flower redFl;  // Objects with images can't created (instantiated) until after setup() is called.

/* This is the setup method that gets executed exaclty once. */
void setup() {  
  size(600, 400);  
  plainGrass = new Grass();
  pinky = new Gardener();
  pinky.xPos = 10;
  pinky.yPos = plainGrass.yPos - pinky.sHeight;
  redFl = new Flower();
  noLoop();
}

void draw() {
  plainGrass.draw();   
  redFl.draw();
  pinky.draw();
}

/* Notes and challenges for the interested
Try creating the image in the data list to see how this breaks.
Load an image that you got from somewhere else.
Put the image elsewhere.
Resize the image
Which object is on top and why? Have the grass, gardener and flower overlap. Who is layered on top of whom?
 */
