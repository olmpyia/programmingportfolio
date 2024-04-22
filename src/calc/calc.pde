// Mads McDougal || 10/23/23 || calc
Button[] button = new Button[22];
String op, dVal;
boolean left;
float l, r, result;
void setup() {
  size(500, 500);
  dVal ="0";
  op="";
  left =true;
  l=0.0;
  r=0.0;
  result=0.0;
  //base
  rectMode(CENTER);
  stroke(#F8CECC);
  fill(#7D3632);
  rect(240, 250, 250, 400, 50);

  button[0]=new Button(165, 240, 30, 30, "±", false); //inputs
  button[1]=new Button(205, 240, 30, 30, "÷", false);
  button[2]=new Button(245, 240, 30, 30, "-", false);
  button[3]=new Button(285, 240, 30, 30, "+", false);
  button[4]=new Button(325, 240, 30, 30, "x", false);
  //nums
  button[5]=new Button(150, 290, 30, 30, "1", true);
  button[6]=new Button(190, 290, 30, 30, "2", true);
  button[7]=new Button(230, 290, 30, 30, "3", true);

  button[8]=new Button(150, 330, 30, 30, "4", true);
  button[9]=new Button(190, 330, 30, 30, "5", true);
  button[10]=new Button(230, 330, 30, 30, "6", true);

  button[11]=new Button(150, 370, 30, 30, "7", true);
  button[12]=new Button(190, 370, 30, 30, "8", true);
  button[13]=new Button(230, 370, 30, 30, "9", true);

  button[14]=new Button(165, 420, 60, 30, "0", true); //0
  button[15]=new Button(235, 420, 50, 30, ".", true);//.
  button[16]=new Button(310, 420, 70, 30, "=", false);//=

  button[17]=new Button(275, 370, 35, 30, "%", false);//%
  button[18]=new Button(275, 330, 35, 30, "^", false);//^
  button[19]=new Button(275, 290, 35, 30, "(-)", false);//-

  button[20]=new Button(330, 350, 50, 30, "CLEAR", false);//clear
  button[21]=new Button(330, 300, 50, 30, "DELETE", false);//delete
}


void draw() {
  for (int i = 0; i< button.length; i++) {
    button[i].display();
    button[i].hover();
  }
  updateDisplay();
  {
  }
}
void keyPressed() {
  print("key;"+ key);
  println("keycode:" + keyCode);
  if (key == 0 || keyCode ==96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key ==1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == '+' || keyCode == 17);
  {
    handleEvent("+", false);
  }
  print(dVal);
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length()<12 && isNum) {
    if (dVal.equals("0")) {
      dVal=keyVal;
    } else {
      dVal += keyVal;
    }
    l =float(dVal);
  } else if (!left && dVal.length()<12 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r =float(dVal);
  }
}
void mousePressed() {
  for (int i =0; i<button.length; i++) {
    if (button[i].on && button[i].isNum && left && dVal.length()<16)
    {
      handleEvent((button[i].val), true);
  } else if (button[i].on && button[i].isNum && ! left) {
handleEvent((button[i].val), true);
  } else if (button[i].on && !button[i].isNum && button[i].val == "CLEAR") {
    dVal ="0";
    op="";
    left =true;
    l=0.0;
    r=0.0;
    result=0.0;
  } else if (button[i].on && !button[i].isNum && button[i].val.equals("+")) {
    dVal ="0";
    op="+";
    left =false;
  } else if (button[i].on && !button[i].isNum && button[i].val.equals("=")) {
    preformCalculation();
    op="=";
  } else if (button[i].on && !button[i].isNum && button[i].val.equals("-")) {
    dVal ="0";
    op="-";
    left =false;
  } else if (button[i].on && !button[i].isNum && button[i].val.equals("(-)")) {
    dVal ="0";
    op="(-)";
    left =false;
  } else if (button[i].on && !button[i].isNum && button[i].val.equals("÷")) {
    dVal ="0";
    op="÷";
    left =false;
  } else if (button[i].on && !button[i].isNum && button[i].val.equals("x")) {
    dVal ="0";
    op="x";
    left =false;
  } else if (button[i].on && !button[i].isNum && button[i].val.equals("±")) {
    left =false;
    op="±";
    if (left) {
      l =-l;
      dVal = str(l);
    } else {
      r=-r;
      dVal = str(r);
    }
  } else if (button[i].on && !button[i].isNum && button[i].val.equals("%")) {
    dVal ="0";
    op="%";
    left =false;
  } else if (button[i].on && !button[i].isNum && button[i].val.equals("^")) {
    dVal ="0";
    op="^";
    left =false;
  } else if (button[i].on && !button[i].isNum && button[i].val.equals("DELETE")) {
    dVal ="0";
    op="DELETE";
  }

  println("l:" + l);
  println("r:" + r);
  println("op:" + op);
  println("result:" + result);
  println("left:" + left);
}
}

void updateDisplay() {
  rectMode(CENTER);
  stroke(0);
  fill(60);
  rect(240, 140, 200, 130);
  fill(0);
  textSize(20);
  text(dVal, 170, 130);
}





void preformCalculation() {
  if (op.equals("+")) { //+
    result = l + r;
  } else if (op.equals("-")) { //-
    if (l>r) {
      result=l-r;
    } else if (r>l) {
      result = l+(-r);
    }
  } else if (op.equals("(-)")) { //(-)
    if (r<l)
      result = r;
  }
  if (op.equals("÷")) { //÷
    result = l / r;
  }
  if (op.equals("x")) { //x
    result = l * r;
  }
  if (op.equals("±")) { //±
  }
  if (op.equals("%")) { //%
    result = l / 100;
  }
  if (op.equals("^")) { //^
    result = pow(l, r);
  }
  if (op.equals("DELETE")) { //DELETE
    if (dVal.charAt(dVal.length()-1) == 'l') {
      dVal = dVal.substring(0, dVal.length() -1);

      result = dVal.length()-1;
    } else if (dVal.charAt(dVal.length()-1) == 'r') {
      dVal = dVal.substring(0, dVal.length() -1);

      result = l;
    }
  }
  dVal = str(result);
  l=result;
}
