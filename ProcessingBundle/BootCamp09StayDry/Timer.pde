/*  millis() is a Processing method that returns the exact time that the program was started.
    Work out the math of show() yourself....
    
*/
class Timer {
  float startTime = 0;

  Timer() {
    startTime = millis();
  
  }
  
  float show() {
    return int((millis() - startTime)/1000);
  }
  
}
