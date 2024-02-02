// Mads McDougal | 9/25 | f c
void setup() {
  size(400, 600);
}
void draw() {
  background(30, 80, 100);
  textAlign(CENTER);
  textSize(25);
  fill(0);

  textSize(10);
  text("Drag the mouse over the desired \n amount, to see the conversion.", 200, 200);
  textSize(20);
  text("Lbs to Kg | Mads McDougal", width/2, 35);
  line(100, 100, 100, height);
  line(300, 100, 300, height);
  textSize(18);
  text("Lbs to Kg", 90, 80);
  text("Kg to Lbs", 290, 80);

  for (int i=100; i<height; i+=20) {
    line(95, i, 105, i);
    line(295, i, 305, i);
    textSize(12);
    text(height -i, 85, i+4);
    text(height -i, 285, i+4);
  }

  if (mouseX < 250 && mouseY > 100) {
    fill(0);
    rect(110, mouseY, 20, height-mouseY);
    fill(255);
    text(LbsToKg(height-mouseY), 129, mouseY+15);
  } else if (mouseX >250 && mouseY > 100) {
    rect(310, mouseY, 20, height-mouseY);
    fill(255);
    text(KgToLbs(height-mouseY), 315, mouseY+20);
  }
 //<>//
  println("far:" + mouseX + "Kg:" + LbsToKg(mouseX));
  println("far:" + mouseX + "Lbs:" + KgToLbs(mouseX));
}

float LbsToKg(float val) {
  val = (val / 2.205);
  return val;
} //<>//
float KgToLbs(float val) {
  val=(val * 2.205);
  return val;
}
