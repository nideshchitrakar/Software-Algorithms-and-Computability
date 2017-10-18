import processing.video.*; 
Capture video; 

int click = 0;
 
void setup() { 
  size(640, 480); 
  video = new Capture(this, 640, 480);
  video.start();
} 

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  image(video, 0, 0);
  
  //flipping the image horizontally to mirror the objects from the camera
  pushMatrix();
  scale(-1,1);
  image(video.get(),-width,0);
  popMatrix();
  
  switch(click) {
    case 0:
      filter(POSTERIZE,4);
      break;
    case 1:
      filter(INVERT);
      break;
    default:
      break;
  }
}

void mouseClicked() {
  if (click == 0) {
    click = 1;
  } else if (click == 1) {
    click = 0;
  }
}