/*  Illustrates simple movement that is continuous.  Check out the rain drop!
    Notice that it places the raindrop RANDOMLY
    
   BootCamp Processing is developed by Ursula Wolz for Riversound Solutions
   Please attribute if you remix.
 */

Grass plainGrass;  
Gardener pinky;  
Flower redFl;   
Flower redFl2;
Vase theVase;
RainDrop aDrop;
RainDrop secondDrop;
RainDrop thirdDrop;

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
  
  secondDrop = new RainDrop(width/2, int(random(-100,0)));
  thirdDrop = new RainDrop(width/4, int(random(-100,0)));
}

void draw() {
  background(#BCEAF2);
  plainGrass.draw();   
  theVase.draw();
  redFl.draw();
  redFl2.draw();
  pinky.draw();
  aDrop.draw();
  
  secondDrop.draw();
  thirdDrop.draw();

  pinky.move(theVase.xPos - pinky.sWidth); 
  aDrop.move(height*2/3);
  
  secondDrop.move(height*2/3);
  thirdDrop.move(height*2/3);
}

/* Try adding a few more raindrops....  but don't get carried away. */