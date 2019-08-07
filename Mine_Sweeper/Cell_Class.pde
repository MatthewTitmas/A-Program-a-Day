class Cell {
  PVector CellPosition;
  PVector Position;
  boolean Bomb;
  boolean Pressed;
  boolean Flagged;
  int BombsInRange;

  Cell(float X, float Y) {
    CellPosition = new PVector(X, Y);
    Position = new PVector(X*Spacing, Y*Spacing);
    Bomb = false;
    if (random(1) < 0.2) {
      Bomb = true;
      SquaresToSelect--;
    }
    BombsInRange = 0;
  }

  void FindBombs(Cell[][] Board) {
    for (int i = max(0, (int)CellPosition.x-1); i <= min(GridSize-1, (int)CellPosition.x+1); i++) {
      for (int j = max(0, (int)CellPosition.y-1); j <= min(GridSize-1, (int)CellPosition.y+1); j++) {
        if (i != (int)CellPosition.x || j != (int)CellPosition.y) {
          if (Board[i][j].Bomb) {
            BombsInRange++;
          }
        }
      }
    }
  }

  void Show() {
    if (!Pressed) {
      image(Unpressed, Position.x, Position.y);
      if (Flagged) {
        image(Flag, Position.x, Position.y);
      }
    } else {
      fill(#BDBDBD);
      stroke(#A4A4A4);
      rect(Position.x, Position.y, Spacing, Spacing);
      if (!Bomb) {
        fill(0);
        textSize(Spacing);
        textAlign(CENTER, CENTER);
        text(BombsInRange, Position.x+Spacing/2, Position.y+Spacing/2-Spacing/8);
      } else {
        fill(255, 0, 0);
        rect(Position.x, Position.y, Spacing, Spacing);
        image(BombButton, Position.x, Position.y);
      }
    }
  }

  void Pressed(Cell[][] Board) {
    Pressed = true;
    if (Bomb) {
      Lost = true;
    } else {
      SquaresToSelect--;
      if (BombsInRange == 0) {
        for (int i = max(0, (int)CellPosition.x-1); i <= min(GridSize-1, (int)CellPosition.x+1); i++) {
          for (int j = max(0, (int)CellPosition.y-1); j <= min(GridSize-1, (int)CellPosition.y+1); j++) {
            if (i != (int)CellPosition.x || j != (int)CellPosition.y) {
              if (!Board[i][j].Pressed) {
                Board[i][j].Pressed(Board);
              }
            }
          }
        }
      }
    }
  }

  void Flag() {
    Flagged = !Flagged;
  }
}
