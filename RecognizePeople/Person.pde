import processing.sound.*;

public class Person {
  PImage photo;
  SoundFile sound;
  String extension = ".mp3";
 
  /*void showImage(String name) {  // this is mine
     // Figure out which file type it is.
     
     photo = loadImage(name); // Is the Processing function
  }
  void draw() {
    image(photo, 0, 0);
  }*/
  
  Person(String name) {
    String path = name + "/" + name + ".jpg";
    photo = loadImage(dataPath(path));
    //sound = new SoundFile(this, name+extension);
  }
  
  void draw() {
    image(photo,0,0);
  }
  
   // Needs sounds as well -- left as an exercise for the reader.....
}