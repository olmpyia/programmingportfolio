class Rock {
  int x, y, diam, speed, health;
  PImage rock;

  Rock(int x, int y) {
    this.x=x; // sets member var
    this.y=y;
    diam =int(random(50, 100));
    speed=int(random(5, 10));
    health=diam;
    int rand = int(random(3));
    
    if (rand==0) {
      rock = loadImage("rocks.gif"); //
    } else if (rand ==1) {
      rock = loadImage("New Piskel.gif"); //
    } else if (rand==2) {
      rock=loadImage("roc.png"); //
    }
  }

  void display() {

    imageMode(CENTER);
    rock.resize(diam, diam);
    image(rock, x, y);
  }

  void move() {
    y += speed; // y+=speed;
  }



  boolean reachedBot() { //<>//
    if (y > height+100) {
      return true;
    } else {
      return false;
    }
  }
}
