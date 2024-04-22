class Powup {
  int x, y, diam, speed, val, health;
  PImage pow;
  char type;

  Powup(int x, int y) {
    this.x=x; // sets member var
    this.y=y;
    diam = 100;
    health=diam;
    speed=int(random(5, 10));
    val = int(random(500, 2000));
    int rand = int(random(3));

    if (rand==0) {
      pow = loadImage("New Piskel (4).png"); //ammo
      type = 'a';
    } else if (rand ==1) {
      pow = loadImage("New Piskel (3).png"); //health
      type = 'b';
    } else if (rand==2) {
      pow=loadImage("New Piskel (7).png"); // turret
      type = 'c';
    }
    val = 100;
  }


  void display() {

    imageMode(CENTER);
    pow.resize(diam, diam);
    image(pow, x, y);
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
