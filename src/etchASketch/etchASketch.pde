// Mads McDougal | 9/20/23 | Etch-A-Sketch //<>//
int x, y; //global varible

void setup() {
  size(400, 400);
  frameRate(10);
  x=150;
  y=100;
}

void draw() {
  //background(20, 80, 80);
  stroke(0);
  strokeWeight(2);
  fill(255);
  //drawName();
  //noLoop();
}

void drawName() {
  moveRight(50);
  moveDown(100);
  moveLeft(50);
  moveUp(100);
  moveLeftUp(50);
  moveRightDown(50);
  
}

void moveRight(int rep) { //dont
  for (int i = 0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+(rep);
}


void moveDown(int rep) {
  for (int i = 0; i<rep; i++) { //i++ = i=i+1
    point(x, y+i);
  }
  y=y+(rep);
}

void moveLeft(int rep) { //dont
  for (int i = 0; i<rep; i++) {
    point(x-i, y );
  }
  x=x-(rep);
}

void moveUp(int rep) { //dont
  for (int i = 0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-(rep);
}

void moveLeftUp(int rep) { //dont
  for (int i = 0; i<rep; i++) {
    point(x-i, y+i);
  }
  y=y-(rep);
  x=x-rep;
}
void moveRightDown(int rep) { //dont
  for (int i = 0; i<rep; i++) {
    point(x-50+i, y+50+i);
  }
  y=y+(rep);
  x=x-rep;
}


void keyPressed() {
  if (key == 'w'|| key=='W') {
    moveUp(5);
  } else if (key == 'a' || key == 'A') {
    moveLeft(5);
  } else if (key == 's'||key=='S') {
    moveDown(5);
  } else if (key == 'd'|| key=='D') {
    moveRight(5);
  }
}
void mousePressed(){
saveFrame("line-######.png");}
