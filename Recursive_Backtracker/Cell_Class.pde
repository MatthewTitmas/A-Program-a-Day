class Cell {
  Cell Parent;
  PVector CellPos;
  PVector Position;
  Wall[] Walls;
  boolean Visited;
  // 0 - Top
  // 1 - Right
  // 2 - Bottom
  // 3 - Left

  Cell(float XPos, float YPos, float i, float j) {
    CellPos = new PVector(i, j);
    Position = new PVector(XPos, YPos);
    Walls = new Wall[4];
    Walls[0] = new Wall(XPos, YPos, XPos+Spacing, YPos);
    Walls[1]  = new Wall(XPos+Spacing, YPos, XPos+Spacing, YPos+Spacing);
    Walls[2] = new Wall(XPos, YPos+Spacing, XPos+Spacing, YPos+Spacing);
    Walls[3] = new Wall(XPos, YPos, XPos, YPos+Spacing);
  }

  void Show() {
    for (int i = 0; i < 4; i++) {
      if (Walls[i].Enabled) {
        Walls[i].Show();
      }
    }
  }

  void PickNewCurrent() {
    ArrayList<Cell> PossibleCells = new ArrayList<Cell>();
    if (CellPos.x != 0) {
      if (!Cells[int(CellPos.x)-1][int(CellPos.y)].Visited) {
        PossibleCells.add(Cells[int(CellPos.x)-1][int(CellPos.y)]);
      }
    }
    if (CellPos.y != 0) {
      if (!Cells[int(CellPos.x)][int(CellPos.y)-1].Visited) {
        PossibleCells.add(Cells[int(CellPos.x)][int(CellPos.y)-1]);
      }
    }
    if (CellPos.y != Rows-1) {
      if (!Cells[int(CellPos.x)][int(CellPos.y)+1].Visited) {
        PossibleCells.add(Cells[int(CellPos.x)][int(CellPos.y)+1]);
      }
    }
    if (CellPos.x != Rows-1) {
      if (!Cells[int(CellPos.x)+1][int(CellPos.y)].Visited) {
        PossibleCells.add(Cells[int(CellPos.x)+1][int(CellPos.y)]);
      }
    }
    if (PossibleCells.size() != 0) {
      int RandomNumber = (int(random(0, PossibleCells.size())));
      Cell NewCurrent = PossibleCells.get(RandomNumber);
      if (NewCurrent.CellPos.x == CellPos.x + 1) {
        NewCurrent.Walls[3].Enabled = false;
        Walls[1].Enabled = false;
      }
      if (NewCurrent.CellPos.x == CellPos.x - 1) {
        NewCurrent.Walls[1].Enabled = false;
        Walls[3].Enabled = false;
      }
      if (NewCurrent.CellPos.y == CellPos.y + 1) {
        NewCurrent.Walls[0].Enabled = false;
        Walls[2].Enabled = false;
      }
      if (NewCurrent.CellPos.y == CellPos.y - 1) {
        NewCurrent.Walls[2].Enabled = false;
        Walls[0].Enabled = false;
      }
      CurrentCell = new PVector(NewCurrent.CellPos.x, NewCurrent.CellPos.y);
      NewCurrent.Parent = this;
    } else {
      if (Parent != null) {
        CurrentCell = new PVector(Parent.CellPos.x, Parent.CellPos.y);
      } else {
        Finished = true;
      }
    }
    fill(255, 0, 0);
    rect(Position.x, Position.y, Spacing, Spacing);
  }

  void ShowParent() {
    if (Parent != null) {
      Parent.Highlight();
    }
  }
  void Highlight() {
    fill(0, 0, 255);
    rect(Position.x, Position.y, Spacing, Spacing);
  }
}
