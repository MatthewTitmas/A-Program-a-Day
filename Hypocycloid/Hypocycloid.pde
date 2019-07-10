float Angle = 0;
float RadiusBig;
float RadiusSmall;
int Rate;

InputBox[] Boxes;


void setup() {
  Rate = 100;
  RadiusBig = 300;
  RadiusSmall = 30;
  Boxes = new InputBox[2];
  size(1100, 800);
  background(255);
  Boxes[0] = new InputBox(850, 50, 200, 50, 300);
  Boxes[1] = new InputBox(850, 125, 200, 50, 30);
}

void draw() {
  noStroke();
  fill(200);
  rect(width-300, 0, 300, height);
  for (InputBox Current : Boxes) {
    Current.Update();
    Current.Show();
  }
  strokeWeight(3);
  stroke(0);
  fill(255);
  rect(850, 200, 200, 50);
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Submit", 950, 220);
  strokeWeight(1);
  pushMatrix();
  translate((width-300)/2, height/2);
  for (int i = 0; i < Rate; i++) {
    Angle += PI/1000;
    float XPos = (RadiusBig-RadiusSmall)*cos(Angle) + RadiusSmall*cos((Angle*(RadiusBig-RadiusSmall)/RadiusSmall));
    float YPos = (RadiusBig-RadiusSmall)*sin(Angle) - RadiusSmall*sin((Angle*(RadiusBig-RadiusSmall)/RadiusSmall));
    stroke(0);
    point(XPos, YPos);
  }
  popMatrix();
}

void mousePressed() {
  for (InputBox Current : Boxes) {
    if (mouseX > Current.Position.x && mouseX < Current.Position.x+Current.Width && mouseY > Current.Position.y && mouseY < Current.Position.y+Current.Height) {
      for (InputBox CurrentTwo : Boxes) {
        CurrentTwo.Selected = false;
      }
      Current.Selected = !Current.Selected;
    }
  }
  if (mouseX > 850 && mouseX < 1050 && mouseY >200 & mouseY < 400) {
    noStroke();
    fill(255);
    rect(0,0,800,800);
    RadiusBig = Boxes[0].Value;
    RadiusSmall = Boxes[1].Value;
  }
}

void keyPressed() {
  if (key < 58 && key > 47) {
    int variable = key-48;
    for (InputBox Current : Boxes) {
      if (Current.Selected) {
        Current.Value = Current.Value*10 + (key-48);
        if (Current.Value > 999) {
          Current.Value = floor(Current.Value/10);
        }
      }
    }
  } else if (keyCode == BACKSPACE) {
    for (InputBox Current : Boxes) {
      if (Current.Selected) {
        Current.Value = floor(Current.Value/10);
      }
    }
  }
}
