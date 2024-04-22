
class Button {

  // Button location and size
  float x;
  float y;
  float w;
  float h;
  // Is the button on or off?
  boolean isNum;
  boolean on;
  String val;
  // Constructor initializes all variables
  Button(float tempX, float tempY, float tempW, float tempH, String val, boolean isNum) {
    x  = tempX;
    y  = tempY;
    w  = tempW;
    h  = tempH;
    on = false;  // Button always starts as off
    this.val = val;
    this.isNum =isNum;
  }
  void display() {

    rectMode(CENTER);
    if (on) {
      fill(#AB7E7E);
    } else {
      fill(#E3A7A7);
    }
    strokeWeight(.5);
    stroke(#FFF0EB);
    rect(x, y, w, h, 5);
    fill(255);
    strokeWeight(2);
    textSize(11);
    text(val, x-13, y+2);
  }




  void hover() {
    if (mouseX>x-w/2 && mouseX<x+w/2 && mouseY>y-h/2 && mouseY<y+h/2) {
      on = true;
    } else {
      on = false;
    }
  }
}
