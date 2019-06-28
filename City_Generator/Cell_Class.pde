class Cell {
  PVector Position;
  PVector Pos;
  float Width;
  float Height;
  float Size;
  color Colour;
  boolean Merged = false;
  Cell(float i, float j, float w, float h, color colour) {
    Pos = new PVector(i, j);
    Position = new PVector(i*Spacing, j*Spacing);
    Width = w;
    Height = h;
    Size = 5;
    Colour = colour;
  }

  void Show() {
    noStroke();
    fill(Colour);
    rect(Position.x+Size, Position.y+Size, Width-Size, Height-Size);
  }

  void Merge() {
    ArrayList<Cell> ToAdd = new ArrayList<Cell>();
    Merged = true;
    boolean Top = false;
    boolean Left = false;
    boolean Bottom = false;
    boolean Right = false;

    if (Pos.x != 0) {
      if (City[int(Pos.x)-1][int(Pos.y)].Colour == Colour) {
        ToAdd.add(City[int(Pos.x)-1][int(Pos.y)]);
        Right = true;
      }
    }
    if (Pos.y != 0) {
      if (City[int(Pos.x)][int(Pos.y)-1].Colour == Colour) {
        ToAdd.add(City[int(Pos.x)][int(Pos.y)-1]);
        Top = true;
      }
    }
    if (Pos.y != Rows-1) {
      if (City[int(Pos.x)][int(Pos.y)+1].Colour == Colour) {
        ToAdd.add(City[int(Pos.x)][int(Pos.y)+1]);
        Bottom = true;
      }
    }
    if (Pos.x != Cols-1) {
      if (City[int(Pos.x)+1][int(Pos.y)].Colour == Colour) {
        ToAdd.add(City[int(Pos.x)+1][int(Pos.y)]);
        Left = true;
      }
    }

    if (Right) {
      Width += 5;
    }
    if (Top) {
      Position.y -= 5;
      Height += 5;
    } if (Left) {
      Position.x -= 5;
      Width += 5;
    } if (Bottom) {
      Height += 5;
    }

    for (Cell Current : ToAdd) {
      if (Current.Merged != true) {
        Current.Merge();
      }
    }
  }
}



class Building extends Cell {
  Building(float i, float j, float w, float h, color Colour) {
    super(i, j, w, h, Colour);
  }
}

class Road extends Cell {
  Road(float i, float j, float w, float h, color Colour) {
    super(i, j, w, h, Colour);
  }
}
