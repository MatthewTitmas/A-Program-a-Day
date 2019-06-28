class Cell {
  PVector Position;
  PVector CellPos;
  color Colour;

  Cell(float XPos, float YPos, float i, float j) {
    Position = new PVector(XPos, YPos);
    CellPos = new PVector(i, j);
    Colour = #FFFFFF;
  }

  void Show() {
    rectMode(CORNER);
    fill(Colour);
    rect(Position.x, Position.y, Spacing, Spacing);
  }

  void FloodFill(color ToFill) {
    ArrayList<Cell> ToAdd = new ArrayList<Cell>();
    if (CellPos.x != 0) {
      if (Cells[int(CellPos.x)-1][int(CellPos.y)].Colour == Colour) {
        ToAdd.add(Cells[int(CellPos.x)-1][int(CellPos.y)]);
      }
    }

    if (CellPos.y != 0) {
      if (Cells[int(CellPos.x)][int(CellPos.y)-1].Colour == Colour) {
        ToAdd.add(Cells[int(CellPos.x)][int(CellPos.y)-1]);
      }
    }
    if (CellPos.y != Rows-1) {
      if (Cells[int(CellPos.x)][int(CellPos.y)+1].Colour == Colour) {
        ToAdd.add(Cells[int(CellPos.x)][int(CellPos.y)+1]);
      }
    }
    if (CellPos.x != Rows-1) {
      if (Cells[int(CellPos.x)+1][int(CellPos.y)].Colour == Colour) {
        ToAdd.add(Cells[int(CellPos.x)+1][int(CellPos.y)]);
      }
    }
    Colour = ToFill;
    for (Cell Current : ToAdd) {
      if (Current.Colour != ToFill) {
        Current.FloodFill(ToFill);
      }
    }
  }
}
