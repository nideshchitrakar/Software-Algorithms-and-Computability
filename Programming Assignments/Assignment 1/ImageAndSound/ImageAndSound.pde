/*  Software, Algorithms and Computability Fall 2017
    code written by Nidesh Chitrakar '18
    
    =======================================================
    
    displays my picture and plays a sound file of my name's
    pronunciation when the user clicks on the window.

  */

import processing.sound.*;

PImage myImg;
SoundFile nameFile;

void setup() {
  size(480,640);
  myImg = loadImage("NideshChitrakar.png");  // loading the image file as myImg
  nameFile = new SoundFile(this, "NideshChitrakar.mp3");  // loading the sound file as nameFile
}

void draw() {
  image(myImg,0,0,width,height);
}

void mouseClicked() {
  nameFile.play();  // plays back the sound file on mouse click and release
}