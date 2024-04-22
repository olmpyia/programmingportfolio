class Laser {
  int x, y, w, h, speed;

  Laser(int x, int y) {
    this.x=x;
    this.y=y;
    w=3;
    h=30;
    speed=8;
  }

  void display() {
    noStroke();
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
  void move() {
    y-=speed;
  }

  boolean reachedTop() {
    if (y <-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intercept(Rock r) {
    float d =dist(x,y,r.x,r.y);
    if (d<r.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
