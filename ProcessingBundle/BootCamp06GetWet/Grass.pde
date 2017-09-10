class Grass {

  int xPos = 0;
  int yPos = height*2/3;
  int sWidth = width; // since this is an INNER CLASS, we can get the PApplet width and height
  int sHeight = height/3; // sprit width, not to be confused with PApple width;
 
  
  color gColor = color(0, 255,0);

  void draw() {
    /* The fill method takes a variety of parameters.  Here we are using the 'red', 'green', 'blue' form.
     The first parameter is red, the second is green, the third is blue.
     You can pick colors with the color selector under the tools menu.
     */
    fill(gColor); 

    rect(xPos, yPos, sWidth, sHeight);
  }
}

