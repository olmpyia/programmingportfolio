// Mads McDougal | 9/11/23 | Grades

void setup() {
  size(400, 200);
  background(100);
}

void draw() {
  background(100);
  //title
  textAlign(CENTER);
  textSize(20);
  text("Grade App | \n By Mads McDougal", width/2, 40);
  //reference
  line(0, 100, width, 100);

  //tic mark
  for (int i = 0; i <width; i+=20) {
    line(i, 105, i, 95);
  }
  //display grade
  textSize(15);
  ellipse(mouseX, 100, 10, 10);
  text(mouseX*0.01, mouseX, 90);
  assignGrade(mouseX*0.01);
}

void assignGrade(float grade) {
  if (grade >= 3.50) {
    text(grade + " Assign letter grade A.", width/2, 130);
  } else if (grade >= 3.0) {
    text(grade + " Assign letter grade A-.", width/2, 130);
  } else if (grade >= 2.99) {
    text(grade + " Assign letter grade B+.", width/2, 130);
  } else if (grade >= 2.83) {
    text(grade + " Assign letter grade B.", width/2, 130);
  } else if (grade >= 2.66) {
    text(grade + " Assign letter grade B-.", width/2, 130);
  } else if (grade >= 2.49) {
    text(grade + " Assign letter grade C+.", width/2, 130);
  } else if (grade >= 2.33) {
    text(grade + " Assign letter grade C.", width/2, 130);
  } else if (grade >= 2.16) {
    text(grade + " Assign letter grade C-.", width/2, 130);
  } else if (grade >= 1.99) {
    text(grade + " Assign letter grade D+.", width/2, 130);
  } else if (grade >= 1.65) {
    text(grade + " Assign letter grade D.", width/2, 130);
  } else if (grade >= 1.32) {
    text(grade + " Assign letter grade D-.", width/2, 130);
  } else {// one condition statment that can only have 2 options unless you add more elses
    text(grade + " assign letter grade F.", width/2, 130);
  }
}
