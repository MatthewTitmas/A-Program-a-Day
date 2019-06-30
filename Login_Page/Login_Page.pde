int CircleConnections[];
Textbox[] Textboxes;

void setup() {
  fullScreen();
  CircleConnections = new int[7];
  Gradient(0, 0, width/4, height, #0D1D28, #225171);
  fill(#225171);
  rect(width/4, 0, width/2, height);
  Gradient(3*width/4, 0, width/4, height, #225171, #0D1D28);
  for (int i = 0; i < CircleConnections.length; i++) {
    CircleConnections[i] = floor(random(0, CircleConnections.length));
  }
  Textboxes = new Textbox[2];
  // Textbox[0] = Username Box
  // Textbox[1] = Password Box
  Textboxes[0] = new Textbox(71, 490, 500, 50, "Username", false);
  Textboxes[1] = new Textbox(71, 600, 500, 50, "Password", true);
}

void draw() {
  Gradient(0, 0, width/4, height, #0D1D28, #225171);
  fill(#225171);
  rect(width/4, 0, width/4, height);
  DrawCircles();
  fill(255);
  textSize(84);
  textAlign(LEFT);
  text("Login:", 100, 450);
  rect(100, 455, 100, 7);
  rect(245, 455, 100, 7);
  rect(63, 550, 530, 3);
  rect(63, 660, 530, 3);
  for (int i = 0; i < Textboxes.length; i++) {
    Textboxes[i].Show();
  }
  fill(255);
  rect(100, 700, 300, 50, 10);
  fill(0);
  textSize(32);
  textAlign(CENTER,CENTER);
  text("Submit", 250, 720);
}



void Gradient(int XPos, int YPos, float Width, float Height, color C1, color C2) {
  noFill();
  for (int i = XPos; i <= XPos+Width; i++) {
    float inter = map(i, XPos, XPos+Width, 0, 1);
    color c = lerpColor(C1, C2, inter);
    stroke(c);
    line(i, YPos, i, YPos+Height);
  }
}

void DrawCircles() {
  int[] XPos = {150, 306, 486, 597, 366, 537, 767};
  int[] YPos = {188, 103, 47, 193, 315, 315, 137};
  int[] Diameter = {63, 21, 31, 41, 31, 34, 54};
  color[] Colours = {#223265, #2C4FA0, #6781BE, #4665AE, #435C97, #6781BE, #475789};
  strokeWeight(2);
  stroke(#345873);
  if (random(1) < 0.2) {
    int RandomNumberOne = floor(random(XPos.length));
    int RandomNumberTwo = floor(random(XPos.length));
    CircleConnections[RandomNumberOne] = RandomNumberTwo;
  }
  for (int i = 0; i < XPos.length; i++) {
    line(XPos[i], YPos[i], XPos[CircleConnections[i]], YPos[CircleConnections[i]]);
  }
  noStroke();
  for (int i = 0; i < XPos.length; i++) {
    fill(Colours[i]);
    ellipse(XPos[i], YPos[i], Diameter[i], Diameter[i]);
  }
}

void keyPressed() {
  for (int i = 0; i < Textboxes.length; i++) {
    if (Textboxes[i].Chosen) {
      if (key == BACKSPACE) {
        Textboxes[i].RemoveText();
      } else {
        Textboxes[i].AddText(key);
      }
    }
  }
}

void mouseClicked() {
  for (int i = 0; i < Textboxes.length; i++) {
    if (mouseX > Textboxes[i].Position.x && mouseX < Textboxes[i].Position.x+Textboxes[i].Width && mouseY > Textboxes[i].Position.y && mouseY < Textboxes[i].Position.y+Textboxes[i].Height) {
      Textboxes[i].Chosen = !Textboxes[i].Chosen;
    } else {
      Textboxes[i].Chosen = false;
    }
  }
}
