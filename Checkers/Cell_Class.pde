class Cell {
  boolean Colour;
  // White -> True
  // Black -> False
  PVector Position;
  PVector CellPos;
  PImage Image = null;
  boolean King = false;
  String Occupied;

  Cell(float i, float j) {
    Position = new PVector(i*Spacing + Spacing/2, j*Spacing+Spacing/2);
    CellPos = new PVector(i, j);
  }

  void Show() {
    imageMode(CENTER);
    ellipseMode(CENTER);
    if (Image != null) {
      if (Image == WhiteKing) {
        fill(0);
        ellipse(Position.x, Position.y, 50, 50);
      } else if (Image == BlackKing) {
        fill(255);
        ellipse(Position.x, Position.y, 50, 50);
      }
      image(Image, Position.x, Position.y);
    }
  }



  void Update() {
    if (Image != null) {
      if (Image == WhitePawn || Image == WhiteKing) {
        Colour = true;
        if (CellPos.y == 7) {
          Image = WhiteKing;
          King = true;
        }
        Occupied = "White";
      } else {
        Occupied = "Black";
        Colour = false;        
        if (CellPos.y == 0) {
          Image = BlackKing;
          King = true;
        }
      }
    } else {
      Occupied = "False";
    }
  }

  ArrayList<PVector> GetMoves(Cell[][] Board) {
    ArrayList<PVector> Moves = new ArrayList<PVector>();
    if (King) {
      if (CellPos.x > 0 && CellPos.y < 7) {
        if (Board[int(CellPos.x-1)][int(CellPos.y+1)].Occupied == "False") {
          Moves.add(new PVector(CellPos.x-1, CellPos.y+1));
        }
      }
      if (CellPos.x < 7 && CellPos.y < 7) {
        if (Board[int(CellPos.x+1)][int(CellPos.y+1)].Occupied == "False") {
          Moves.add(new PVector(CellPos.x+1, CellPos.y+1));
        }
      }
      if (CellPos.x > 0 && CellPos.y > 0) {
        if (Board[int(CellPos.x-1)][int(CellPos.y-1)].Occupied == "False") {
          Moves.add(new PVector(CellPos.x-1, CellPos.y-1));
        }
      }
      if (CellPos.x < 7 && CellPos.y > 0) {
        if (Board[int(CellPos.x+1)][int(CellPos.y-1)].Occupied == "False") {
          Moves.add(new PVector(CellPos.x+1, CellPos.y-1));
        }
      }
    } else if (Colour == true) {
      if (CellPos.x > 0) {
        if (Board[int(CellPos.x-1)][int(CellPos.y+1)].Occupied == "False") {
          Moves.add(new PVector(CellPos.x-1, CellPos.y+1));
        }
      }
      if (CellPos.x < 7) {
        if (Board[int(CellPos.x+1)][int(CellPos.y+1)].Occupied == "False") {
          Moves.add(new PVector(CellPos.x+1, CellPos.y+1));
        }
      }
    } else {
      if (CellPos.x > 0) {
        if (Board[int(CellPos.x-1)][int(CellPos.y-1)].Occupied == "False") {
          Moves.add(new PVector(CellPos.x-1, CellPos.y-1));
        }
      }
      if (CellPos.x < 7) {
        if (Board[int(CellPos.x+1)][int(CellPos.y-1)].Occupied == "False") {
          Moves.add(new PVector(CellPos.x+1, CellPos.y-1));
        }
      }
    }
    return Moves;
  }

  ArrayList<PVector> GetJumps(Cell[][] Board) {
    ArrayList<PVector> Moves = new ArrayList<PVector>();
    if (King) {
      if (Colour) {
        if (CellPos.x > 1 && CellPos.y < 6) {
          if (Board[int(CellPos.x-1)][int(CellPos.y+1)].Occupied == "Black" && Board[int(CellPos.x-2)][int(CellPos.y+2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x-2, CellPos.y+2));
          }
        }
        if (CellPos.x > 1 && CellPos.y > 1) {
          if (Board[int(CellPos.x-1)][int(CellPos.y-1)].Occupied == "Black" && Board[int(CellPos.x-2)][int(CellPos.y-2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x-2, CellPos.y-2));
          }
        }

        if (CellPos.x < 6 && CellPos.y < 6) {
          if (Board[int(CellPos.x+1)][int(CellPos.y+1)].Occupied == "Black" && Board[int(CellPos.x+2)][int(CellPos.y+2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x+2, CellPos.y+2));
          }
        }
        if (CellPos.x < 6 && CellPos.y > 1) {
          if (Board[int(CellPos.x+1)][int(CellPos.y-1)].Occupied == "Black" && Board[int(CellPos.x+2)][int(CellPos.y-2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x+2, CellPos.y-2));
          }
        }
      } else {
        if (CellPos.x > 1 && CellPos.y < 6) {
          if (Board[int(CellPos.x-1)][int(CellPos.y+1)].Occupied == "White" && Board[int(CellPos.x-2)][int(CellPos.y+2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x-2, CellPos.y+2));
          }
        }
        if (CellPos.x > 1 && CellPos.y > 1) {
          if (Board[int(CellPos.x-1)][int(CellPos.y-1)].Occupied == "White" && Board[int(CellPos.x-2)][int(CellPos.y-2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x-2, CellPos.y-2));
          }
        }

        if (CellPos.x < 6 && CellPos.y < 6) {
          if (Board[int(CellPos.x+1)][int(CellPos.y+1)].Occupied == "White" && Board[int(CellPos.x+2)][int(CellPos.y+2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x+2, CellPos.y+2));
          }
        }
        if (CellPos.x < 6 && CellPos.y > 1) {
          if (Board[int(CellPos.x+1)][int(CellPos.y-1)].Occupied == "White" && Board[int(CellPos.x+2)][int(CellPos.y-2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x+2, CellPos.y-2));
          }
        }
      }
    } else {
      if (Colour == true) {
        if (CellPos.x > 1 && CellPos.y < 6) {
          if (Board[int(CellPos.x-1)][int(CellPos.y+1)].Occupied == "Black" && Board[int(CellPos.x-2)][int(CellPos.y+2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x-2, CellPos.y+2));
          }
        }
        if (CellPos.x < 6 && CellPos.y < 6) {
          if (Board[int(CellPos.x+1)][int(CellPos.y+1)].Occupied == "Black" && Board[int(CellPos.x+2)][int(CellPos.y+2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x+2, CellPos.y+2));
          }
        }
      } else {
        if (CellPos.x > 1 && CellPos.y > 1) {
          if (Board[int(CellPos.x-1)][int(CellPos.y-1)].Occupied == "White" && Board[int(CellPos.x-2)][int(CellPos.y-2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x-2, CellPos.y-2));
          }
        }
        if (CellPos.x < 6 && CellPos.y > 1) {
          if (Board[int(CellPos.x+1)][int(CellPos.y-1)].Occupied == "White" && Board[int(CellPos.x+2)][int(CellPos.y-2)].Occupied == "False") {
            Moves.add(new PVector(CellPos.x+2, CellPos.y-2));
          }
        }
      }
    }
    return Moves;
  }
}
