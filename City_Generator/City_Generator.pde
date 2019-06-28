int Rows = 10;
int Cols = 15;
float Spacing;
Cell[][] City;

void setup() {
  size(1205, 805);
  Spacing = (width-5)/Cols;
  GenerateCity();
}

void draw() {
  background(0, 255, 0);
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Rows; j++) {
      if (City[i][j] != null) {
        City[i][j].Show();
      }
    }
  }
}




void GenerateCity() {
  City = new Cell[Cols][Rows];
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Rows; j++) {
      if (j % 2 == 0) {
        City[i][j] = new Building(i, j, Spacing, Spacing, 127);
      } else {
        City[i][j] = new Road(i, j, Spacing, Spacing, 255);
      }
    }
  }
  City[14][2] = new Road(14, 2, Spacing, Spacing, 255);
  City[4][4] = new Road(4, 4, Spacing, Spacing, 255);
  City[3][6] = new Road(3, 6, Spacing, Spacing, 255);
  City[7][8] = new Road(7, 8, Spacing, Spacing, 255); 
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Rows; j++) {
      if (!City[i][j].Merged) {
        City[i][j].Merge();
      }
    }
  }
}



void mousePressed() {
  int XPos = floor(mouseX/Spacing);
  int YPos = floor(mouseY/Spacing);
  if (mouseButton == LEFT) {
    City[XPos][YPos] = new Building(XPos, YPos, Spacing, Spacing, 127);
  } else if (mouseButton == RIGHT) {
    City[XPos][YPos] = new Road(XPos, YPos, Spacing, Spacing, 255);
  }
  City[XPos][YPos].Merge();
}

void mouseDragged() {
  int XPos = floor(mouseX/Spacing);
  int YPos = floor(mouseY/Spacing);
  if (YPos > 0 && XPos > 0 && YPos < Rows-1 && XPos < Cols-1) {
    if (mouseButton == LEFT) {
      City[XPos][YPos] = new Building(XPos, YPos, Spacing, Spacing, 127);
    } else if (mouseButton == RIGHT) {
      City[XPos][YPos] = new Road(XPos, YPos, Spacing, Spacing, 255);
    }
    City[XPos][YPos].Merge();
  }
}
