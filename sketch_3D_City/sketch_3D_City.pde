int Rows = 25;
float Spacing;
float RotationAngle = 0;
float YAngle = -13;
Cell[][] Cells;
float Scale = 1;

void setup() {
  size(800, 800, P3D);
  Spacing = 80;
  Cells = new Cell[Rows][Rows];
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      float XPos = map(i, 0, Rows-1, -Rows*50, Rows*50);
      float YPos = map(j, 0, Rows-1, -Rows*50, Rows*50);
      if (random(0, 1) < 0.7) {
        Cells[i][j] = new Building(XPos, YPos, Spacing, Spacing);
      } else {
        Cells[i][j] = new House(XPos,YPos,Spacing,Spacing);
      }
    }
  }
}

void draw() {
  lights();
  noStroke();
  background(#50AFE4);
  translate(width/2, height/2, -300);
  rotateX(radians(YAngle));
  rotateY(RotationAngle);
  scale(Scale);
  fill(#7CA91D);
  box(15000, 0, 15000);
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      if (Cells[i][j] != null) {
        Cells[i][j].Render();
      }
    }
  }
  RotationAngle += 0.01;
}

void mouseDragged() {
  YAngle += ((pmouseY - mouseY)/10);
  if (YAngle > -13) {
    YAngle = -13;
  } else if (YAngle < -90) {
    YAngle = -90;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  Scale += e/10;
  if (Scale < 0.3) { 
    Scale = 0.3;
  } else if (Scale > 3) {
    Scale = 3;
  }
}
