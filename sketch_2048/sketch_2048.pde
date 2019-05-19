float Spacing;
Cell[][] Cells = new Cell[4][4];

void setup() {
  size(800,800);
  Spacing = width/4;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      Cells[i][j] = new Cell(i,j);
    }
  }
  AddCell();
  AddCell();
}

void draw() {
  background(255);
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      Cells[i][j].Show();
      Cells[i][j].Update();
    }
  }  
}

void keyPressed() {
  if (key == 'a') {
    MoveLeft();
    Reset();
    AddCell();
  } else if (key == 's') {
    MoveDown();
    Reset();
    AddCell();
  } else if (key == 'w') {
    MoveUp();
    Reset();
    AddCell();
  } else if (key == 'd') {
    MoveRight();
    Reset();
    AddCell();
  }
}

void MoveLeft() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (Cells[i][j].Value != 0) {
        Cells[i][j].MoveLeft(Cells, i, j);
      }
    }
  }
}

void MoveRight() {
  for (int i = 3; i >= 0; i--) {
    for (int j = 0; j < 4; j++) {
      if (Cells[i][j].Value != 0) {
        Cells[i][j].MoveRight(Cells, i, j);
      }
    }
  }
}

void MoveUp() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (Cells[i][j].Value != 0) {
        Cells[i][j].MoveUp(Cells, i, j);
      }
    }
  }
}

void MoveDown() {
  for (int i = 3; i >= 0; i--) {
    for (int j = 3; j >= 0; j--) {
      if (Cells[i][j].Value != 0) {
        Cells[i][j].MoveDown(Cells, i, j);
      }
    }
  }
}

void Reset() {
  for (int i = 0; i < 4; i ++) {
    for (int j = 0; j < 4; j ++) {
      Cells[i][j].JustCombined = false;
    }
  }
}

void AddCell() {
  boolean Added = false;
  while (!(Added)) {
    int X = int(random(0,4));
    int Y = int(random(0,4));
    if (Cells[X][Y].Value == 0) {
      Added = true;
      if (random(0,1) < 0.15) {
        Cells[X][Y].Value = 4;
      } else {
        Cells[X][Y].Value = 2;
      }
    }
  }
}
