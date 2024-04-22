class ship {
  int x, y, w, health, ammo, turretCount;
  PImage ship;

  ship(int x, int y) {
    this.x=x;
    this.y=y;
    w=100;
    ammo=1000;
    health=500;
    turretCount=1;
    ship = loadImage("New Piskel (5).png");
  }


  void display() {
    imageMode(CENTER);
    ship.resize(w, w);
    image(ship, x, y);
  }

  void move(int x, int y) {
    this.x=x;
    this.y=y;
  }

  boolean fire() {
    if (ammo>0) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    return true;
  }

  boolean intersect(Rock r) {
    float d =dist(x, y, r.x, r.y);
    if (d<r.diam/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersectPU(Powup pu) {
    float d =dist(x, y, pu.x, pu.y);
    if (d<pu.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
