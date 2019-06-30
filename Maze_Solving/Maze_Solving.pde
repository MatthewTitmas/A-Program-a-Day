boolean Finished;
float Spacing;
int Rows = 20;
Cell[][] Cells;
PVector CurrentCell;
Cell CurrentNode;
ArrayList<Cell> PossibleMoves;
boolean Continue;
boolean Search;

void setup() {
  size(800, 800);
  Reset();
}

void draw() {
  background(255);
  line(0, 0, width, 0);
  line(0, 0, 0, height);
  line(width, 0, width, height);
  line(0, height, width, height);
  if (!Finished) {
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        Cells[i][j].Show();
      }
    }
    Cells[int(CurrentCell.x)][int(CurrentCell.y)].Visited = true;
    Cells[int(CurrentCell.x)][int(CurrentCell.y)].PickNewCurrent();
    CurrentNode = Cells[0][0];
  } else if (Finished == true && Continue == true && Search == true) {
    PossibleMoves = new ArrayList<Cell>();
    if (CurrentNode.Walls[0].Enabled == false && CurrentNode.Position.y != 0) {
      PossibleMoves.add(Cells[int(CurrentNode.CellPos.x)][int(CurrentNode.CellPos.y-1)]);
    }
    if (CurrentNode.Walls[1].Enabled == false && CurrentNode.Position.x != Rows-1) {
      PossibleMoves.add(Cells[int(CurrentNode.CellPos.x+1)][int(CurrentNode.CellPos.y)]);
    }
    if (CurrentNode.Walls[2].Enabled == false && CurrentNode.Position.y != Rows-1) {
      PossibleMoves.add(Cells[int(CurrentNode.CellPos.x)][int(CurrentNode.CellPos.y+1)]);
    }
    if (CurrentNode.Walls[3].Enabled == false && CurrentNode.CellPos.x != 0) {
      PossibleMoves.add(Cells[int(CurrentNode.CellPos.x-1)][int(CurrentNode.CellPos.y)]);
    }

    for (Cell Current : PossibleMoves) {
      if (Current.Distance > CurrentNode.Distance+1 && Current.Djikstra == false) {
        Current.Parent = CurrentNode;
        Current.Distance = CurrentNode.Distance + 1;
      }
    }
    CurrentNode.Djikstra = true;

    int LowestDistance = 10000;
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        if (Cells[i][j].Distance < LowestDistance && Cells[i][j].Djikstra == false) {
          LowestDistance = Cells[i][j].Distance;
          CurrentNode = Cells[i][j];
        }
      }
    }
    fill(255, 0, 0);
    rect(CurrentNode.Position.x, CurrentNode.Position.y, Spacing, Spacing);
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        Cells[i][j].Show();
      }
    }
    Continue = false;
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        if (Cells[i][j].Djikstra == false) {
          Continue = true;
        }
      }
    }
  } else {
    if (Search) {
      Cells[Rows-1][Rows-1].ShowParent();
    }
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Rows; j++) {
        Cells[i][j].Show();
      }
    }
  }
}


void keyPressed() {
  if (key == 'r') {
    Reset();
  }
  if (Finished) {
    if (key == ' ') {
      Search = true;
    }
  }
}

void Reset() {
  CurrentCell = new PVector(0,0);
  PossibleMoves = new ArrayList<Cell>();
  Spacing = width/Rows;
  Cells = new Cell[Rows][Rows];
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      Cells[i][j] = new Cell(i*Spacing, j*Spacing, i, j);
    }
  }
  Cells[int(CurrentCell.x)][int(CurrentCell.y)].Visited = true;
  Cells[0][0].Distance = 0;
  Cells[Rows-1][Rows-1].Goal = true;
  Continue = true;
  Finished = false;
  Search = false;
}
