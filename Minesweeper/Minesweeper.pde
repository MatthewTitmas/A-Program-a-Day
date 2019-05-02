int Rows = 10;
int Cols = 10;
boolean Over = false;
Cell[][] Cells = new Cell[Cols][Rows];

void setup() {
  size(400,400);
  int Width = width/Cols;
  int Height = height/Rows;
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Cols; j++) {
      Cells[i][j] = new Cell(Width,Height,Width*i,Width*j);
    }
  }
}

void draw() {
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      Cells[i][j].GetNumber(Cells);
      Cells[i][j].Show(Cells);
      if (Cells[i][j].Bomb == true && Cells[i][j].Revealed == true) {
        GameOver();
      }
    }
  }
  if (Over == true) {
    noLoop();
  }
}

void mousePressed() {
  int X = mouseX/40;
  int Y = mouseY/40;
  Cells[X][Y].Revealed = true;
  Cells[X][Y].Colour = 200;
}

void GameOver() {
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      Cells[i][j].Revealed = true;
      Cells[i][j].Show(Cells);
    }
  }
  Over = true;
}
