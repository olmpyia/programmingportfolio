class Star {
  int x, y, diam, speed;
  Star(int x, int y) {
    this.x=x;
    this.y=y;
    diam =int(random(1, 10));
    speed=int(random(3, 10));  
  }

  void display() {
fill(255);
circle(x,y,diam);
}
  void move() {
    y = y + speed; // y+=speed;
  }

  boolean reachedBot() {
    if (y > height+100) {
      return true;
    } else {
      return false;
    }
  }
}
