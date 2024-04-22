// Mads McDougal | 11/20/23 | space game //<>//
import processing.sound.*;
SoundFile laser2;
SoundFile tro;

ship s1;
ArrayList <Rock> rock = new ArrayList<Rock>();
ArrayList <Powup> powup = new ArrayList<Powup>();
ArrayList <Laser> laser = new ArrayList<Laser>();
ArrayList <Star> stars = new ArrayList<Star>();

timer rocktimer, putimer;

int score;
boolean play;
int level;
int rockCount, rtimer, lpow;

void setup() {
  laser2 = new SoundFile(this, "laser2.wav");
  tro = new SoundFile(this, "data/tro.mp3");
  tro.play(.5);
  noCursor();
  size(1000, 800);
  rtimer = 1000;
  background(40, 70, 100);
  s1= new ship(20, 20);
  rocktimer = new timer(rtimer);
  rocktimer.start();

  lpow=20;
  play = false;

  putimer=new timer(10000);
  putimer.start();

  score=0;
  level=1;
  rockCount = 0;
}


void draw() {
  if (!play) { //play == false
    startScreen();
  } else {
    background(30);
    //stars


    stars.add(new Star(int(random(width)), -10));
    for (int i = 0; i < stars.size(); i++) {
      Star s = stars.get(i);
      if (s.reachedBot()) {
        stars.remove(s);
      } else {
        s.display();
        s.move();
      }
    }

    if (putimer.isfinished()) {
      powup.add(new Powup(int(random(width)), -100));
      putimer.start();
    }
    for (int i = 0; i < powup.size(); i++) {
      Powup pu = powup.get(i);
      if (s1.intersectPU(pu)) {
        if (pu.type == 'a') {
          s1.ammo += pu.val;
        } else if (pu.type== 'b') {
          s1.health += pu.val;
        } else if (pu.type == 'c') {
          s1.turretCount += 1;
        }
        powup.remove(pu);
      } else {
        pu.display();
        pu.move();
      }
    }

    s1.display();
    s1.move(mouseX, 650);
    // adding rocks
    if (rocktimer.isfinished()) {
      rock.add(new Rock(int(random(width)), -100));
      rocktimer.start();
    }
    //display rocks
    for (int i = 0; i < rock.size(); i++) {
      Rock r = rock.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        score+=r.diam;
        rock.remove(r);
      }
      if (r.reachedBot()) {
        rockCount ++;
        if (rockCount % 10 == 2) {
          level++;
        }
        rock.remove(r);
      } else {

        r.display();
        r.move();
      }
    }

    for (int i = 0; i < laser.size(); i++) {
      Laser l = laser.get(i);
      for (int j = 0; j<rock.size(); j++) {
        Rock r = rock.get(j);
        if (l.intercept(r)) {
          score+=r.diam;
          laser.remove(l);
          r.diam-=lpow;
          if (r.diam<20) {
            rock.remove(r);
          }
        }
      }
      if (l.reachedTop()) {
        laser.remove(l);
      } else {
        l.display();
        l.move();
      }
    }
  }
  //render scoreboard
  infoPanel();

  if (s1.health<0) {
    gameOver();
  }
}


void infoPanel() {
  fill(80, 127); //gray/opacity
  rectMode(CENTER);
  rect(width/2, 30, width, 100);
  fill(255);
  textSize(30);
  text("Score:"+score, 70, 40);
  text("level:"+level, 700, 40);
  text("health:"+s1.health, 870, 70);
  text("ammo:"+s1.ammo, 870, 30);
  println("Rocks:"+rock.size());
  println("laser:"+laser.size());
  println("stars:"+stars.size());
  println("powup:"+powup.size());

  text("Rock count:"+rockCount, 400, 40);
}

void startScreen() {
  background(50);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Welcome to spaceworld", width/2, 300);
  text("by Mads McDougal", width/2, 400);
  text("click mouse to begin adventure", width/2, 500);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(50);
  fill(0);
  textAlign(CENTER);
  textSize(50);
  text("GAME OVER", width/2, 300);
  text("Score:"+score, width/2, 400);
  text("Level:"+level, width/2, 500);
  noLoop();
}

void ticker() {
}

void mousePressed() {
  if (mousePressed == true) {
    laser2.play(2);
  } else if (mousePressed==false) {
    laser2.stop();
  }
  if (s1.fire()) {
    switch(s1.turretCount) {
    case 1:
      laser.add(new Laser(s1.x, s1.y-20));
      s1.ammo-=1;
      break;
    case 2:
      laser.add(new Laser(s1.x-15, s1.y-20));
      laser.add(new Laser(s1.x+15, s1.y-20));
      s1.ammo-=2;
      break;
    case 3:
      laser.add(new Laser(s1.x, s1.y-20));
      laser.add(new Laser(s1.x-15, s1.y-20));
      laser.add(new Laser(s1.x+15, s1.y-20));

      break;
    }
  }
}
