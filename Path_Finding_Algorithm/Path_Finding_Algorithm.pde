Cell[][] Cells;
Cell[] AdjacentCells;
int Rows = 20;
float Spacing;
Cell CurrentCell;

ArrayList<Cell> ClosedList;
ArrayList<Cell> OpenList;
boolean EndFound = false;


void setup() {
  frameRate(60);
  size(800, 800);
  CurrentCell = new Cell(1, 1, 1);
  AdjacentCells = new Cell[4];
  Spacing = width/Rows;
  Cells = new Cell[Rows][Rows];
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {  
      Cells[i][j] = new Cell(i, j, i*Rows+j);
    }
  }
  while (Cells[0][0].Wall) {
    Cells[0][0] = new Cell(0, 0, 0);
  }
  while (Cells[Rows-1][Rows-1].Wall) {
    Cells[Rows-1][Rows-1] = new Cell(Rows-1, Rows-1, (Rows-1)*Rows+Rows);
  }
  Copy(Cells[0][0], CurrentCell);

  ClosedList = new ArrayList<Cell>();
  OpenList = new ArrayList<Cell>();
  OpenList.add(CurrentCell);
}


void draw() {
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {
      fill(Cells[i][j].Colour);
      rect(Cells[i][j].Position.x*Spacing, Cells[i][j].Position.y*Spacing, Spacing, Spacing);
    }
  }
  if (!EndFound) {
    FindAdjacentTiles();
    CalculateValuesForTiles();
    fill(0, 0, 255);
    rect(CurrentCell.Position.x*Spacing, CurrentCell.Position.y*Spacing, Spacing, Spacing);
  } else {
    Cells[0][0].Parent = null;
    CurrentCell.Show();
  }
}


void FindAdjacentTiles() {
  int TotalCost = 10000;
  for (Cell Current : OpenList) {
    if (Current.TotalCost < TotalCost) {
      Copy(Current, CurrentCell);
      TotalCost = Current.TotalCost;
    }
  }
  for (int x = 0; x < OpenList.size(); x++) {
    if (OpenList.get(x).ID == CurrentCell.ID) {
      ClosedList.add(OpenList.get(x));
      OpenList.remove(x);
      break;
    }
  }

  int XPos = int(CurrentCell.Position.x);
  int YPos = int(CurrentCell.Position.y);
  AdjacentCells = new Cell[4];
  if (CurrentCell.Position.y != 0) {
    if (Cells[XPos][YPos-1].Wall == false) {
      AdjacentCells[0] = Cells[XPos][YPos-1];
    }
  }
  if (CurrentCell.Position.y != Rows-1) {
    if (Cells[XPos][YPos+1].Wall == false) {
      AdjacentCells[1] = Cells[XPos][YPos+1];
    }
  }
  if (CurrentCell.Position.x != 0) {
    if (Cells[XPos-1][YPos].Wall == false) {
      AdjacentCells[2] = Cells[XPos-1][YPos];
    }
  } 
  if (CurrentCell.Position.x != Rows-1) {
    if (Cells[XPos+1][YPos].Wall == false) {
      AdjacentCells[3] = Cells[XPos+1][YPos];
    }
  }
}


void CalculateValuesForTiles() {
  int WalkingCost = CurrentCell.WalkingCost += 1;
  for (int i = 0; i < AdjacentCells.length; i++) {
    if (AdjacentCells[i] != null) {
      boolean InClosedList = false;
      for (Cell Current : ClosedList) {
        if (Current.ID == AdjacentCells[i].ID) {
          InClosedList = true;
          break;
        }
      }
      boolean InOpenList = false;
      int InListScore = 0;
      for (Cell Current : OpenList) {
        if (Current.ID == AdjacentCells[i].ID) {
          InOpenList = true;
          if (Current.TotalCost > Current.Score + WalkingCost) {
            Current.TotalCost = Current.Score + WalkingCost;
            if (Current != CurrentCell) {
              Current.Parent = CurrentCell;
              //CurrentCell.Parent = Current;
            }
          }
          break;
        }
      }
      if (InClosedList) {
      } else if (!InOpenList) {
        AdjacentCells[i].TotalCost = AdjacentCells[i].Score + WalkingCost;
        //Copy(CurrentCell,AdjacentCells[i].Parent);
        if (AdjacentCells[i] != CurrentCell) {
          //CurrentCell.Parent = AdjacentCells[i].Parent;
          AdjacentCells[i].Parent = CurrentCell;
        }
        OpenList.add(AdjacentCells[i]);
      }
      if (CurrentCell.Score == 0) {
        println("Found end!");
        EndFound = true;
        break;
      }
    }
  }
}

void mousePressed() {
  Reset();
}

void Copy(Cell ToCopy, Cell Copied) {
  Copied.Colour = ToCopy.Colour;
  Copied.Position.x = ToCopy.Position.x;
  Copied.Position.y = ToCopy.Position.y;
  Copied.ID = ToCopy.ID;
  Copied.Score = ToCopy.Score;
  Copied.Parent = ToCopy.Parent;
  Copied.TotalCost = ToCopy.TotalCost;
  Copied.WalkingCost = ToCopy.WalkingCost;
}

void Reset() {
  CurrentCell = new Cell(1, 1, 1);
  AdjacentCells = new Cell[4];
  Spacing = width/Rows;
  Cells = new Cell[Rows][Rows];
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Rows; j++) {  
      Cells[i][j] = new Cell(i, j, i*Rows+j);
    }
  }
  while (Cells[0][0].Wall) {
    Cells[0][0] = new Cell(0, 0, 0);
  }
  while (Cells[Rows-1][Rows-1].Wall) {
    Cells[Rows-1][Rows-1] = new Cell(Rows-1, Rows-1, (Rows-1)*Rows+Rows);
  }
  Copy(Cells[0][0], CurrentCell);

  ClosedList = new ArrayList<Cell>();
  OpenList = new ArrayList<Cell>();
  OpenList.add(CurrentCell);
  EndFound = false;
}
