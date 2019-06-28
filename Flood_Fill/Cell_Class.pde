class Cell {
  PVector Position;
  PVector CellPos;
  color Colour;
  boolean Stolen;

  Cell(float XPos, float YPos, int i, int j, color colour) {
    Position = new PVector(XPos, YPos);
    CellPos = new PVector(i, j);
    Colour = colour;
    Stolen = false;
  }


  void Show() {
    fill(Colour);
    rect(Position.x, Position.y, Spacing, Spacing);
  }


  void CheckSorrounding(color ColourToFind, Cell[][] Board) {
    println(CellPos.x,CellPos.y);
    Colour = ColourToFind;
    if (CellPos.x != 0) {
      if (Cells[int(CellPos.x)-1][int(CellPos.y)].Stolen != true) {
        ToAdd.add(Cells[int(CellPos.x)-1][int(CellPos.y)]);
      }
    }
    if (CellPos.y != 0) {
      if (Cells[int(CellPos.x)][int(CellPos.y)-1].Stolen != true) {
        ToAdd.add(Cells[int(CellPos.x)][int(CellPos.y)-1]);
      }
    }
    if (CellPos.y != Rows-1) {
      if (Cells[int(CellPos.x)][int(CellPos.y)+1].Stolen != true) {
        ToAdd.add(Cells[int(CellPos.x)][int(CellPos.y)+1]);
      }
    }
    if (CellPos.x != Rows-1) {
      if (Cells[int(CellPos.x)+1][int(CellPos.y)].Stolen != true) {
        ToAdd.add(Cells[int(CellPos.x)+1][int(CellPos.y)]);
      }
    }

    for (int i = ToAdd.size() - 1; i >= 0; i--) {
      Cell Current = ToAdd.get(i);
      if (Current.Colour == ColourToFind) {
        Current.Stolen = true;
      } else {
        ToAdd.remove(i);
      }
    }
  }
}
