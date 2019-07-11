int Cols = 4;
float Spacing;
Cell[][] Cells;
PVector FreeCell;

void setup() {
  size(805, 805);
  Spacing = 800/Cols;
  Cells = new Cell[4][4];
  FreeCell = new PVector(3, 3);
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Cols; j++) {
      Cells[i][j] = new Cell(i, j, j*Cols+i + 1);
    }
  }
  Cells[3][3] = null;
  GetPossibleMoves();
}

void draw() {
  background(#c7a852);
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Cols; j++) {
      if (Cells[i][j] != null) {
        Cells[i][j].Show();
      }
    }
  }
}


void GetPossibleMoves() {
  int X = int(FreeCell.x);
  int Y = int(FreeCell.y);
  if (X != 3) {
    Cells[X+1][Y].Possible = true;
  }
  if (X != 0) {
    Cells[X-1][Y].Possible = true;
  }
  if (Y != 0) {
    Cells[X][Y-1].Possible = true;
  }
  if (Y != 3) {
    Cells[X][Y+1].Possible = true;
  }
}

void mouseClicked() {
  int XPos = floor(mouseX/Spacing);
  int YPos = floor(mouseY/Spacing);
  if (Cells[XPos][YPos] != null) {
    if (Cells[XPos][YPos].Possible) {
      int Value = Cells[XPos][YPos].Number;
      Cells[int(FreeCell.x)][int(FreeCell.y)] = new Cell(FreeCell.x, FreeCell.y, Value);
      Cells[XPos][YPos] = null;
      FreeCell = new PVector(XPos, YPos);
    }
  }
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Cols; j++) {
      if (Cells[i][j] != null) {
        Cells[i][j].Possible = false;
      }
    }
  }
  GetPossibleMoves();
}

void keyPressed() {
  if (key == 'r') {
    Randomize();
  }
}


void Randomize() {
  FreeCell = new PVector(3, 3);
  for (int i = 0; i < Cols; i++) {
    for (int j = 0; j < Cols; j++) {
      Cells[i][j] = new Cell(i, j, j*Cols+i + 1);
    }
  }
  Cells[3][3] = null;
  GetPossibleMoves();
  for (int i = 0; i < 100; i++) {
    for (int x = 0; x < Cols; x++) {
      for (int y = 0; y < Cols; y++) {
        if (Cells[x][y] != null) {
          Cells[x][y].Possible = false;
        }
      }
    }
    GetPossibleMoves();
    ArrayList<Cell> PossibleMoves = new ArrayList<Cell>();
    for (int j = 0; j < Cols; j++) {
      for (int k = 0; k < Cols; k++) {
        if (Cells[j][k] != null) {
          if (Cells[j][k].Possible == true) {
            PossibleMoves.add(Cells[j][k]);
          }
        }
      }
    }
    int Random = floor(random(0, PossibleMoves.size()));
    Cell ToMove = PossibleMoves.get(Random);
    int Value = ToMove.Number;
    Cells[int(FreeCell.x)][int(FreeCell.y)] = new Cell(FreeCell.x, FreeCell.y, Value);
    FreeCell = new PVector(ToMove.Position.x, ToMove.Position.y);
    ToMove = null;
  }
  Cells[int(FreeCell.x)][int(FreeCell.y)] = null;
  for (int x = 0; x < Cols; x++) {
    for (int y = 0; y < Cols; y++) {
      if (Cells[x][y] != null) {
        Cells[x][y].Possible = false;
      }
    }
  }
  GetPossibleMoves();
}
