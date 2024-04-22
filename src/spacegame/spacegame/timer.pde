// Daniel Shiffman
class timer {
  int savedtime, totaltime;
  timer(int tempTotalTime) {
    totaltime=tempTotalTime;
  }
  void start() {
    savedtime=millis();
  }
  boolean isfinished() {
    // Check how much time has passed
    int passedTime = millis()- savedtime;
    if (passedTime > totaltime) {
      return true;
    } else {
      return false;
    }
  }
}
