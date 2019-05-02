class Cell {
  float Width;
  float Height;
  int X;
  int Y;
  boolean Bomb = false;
  boolean Revealed = false;
  int Colour = 255;
  int Amount = 0;
  
  Cell(float W, float H, int x, int y) {
    Width = W;
    Height = H;
    X = x;
    Y = y;
    if (random(0,1) < 0.3) {
      Bomb = true;
    }
  }
  
  void GetNumber(Cell AllCells[][]) {
    Amount = 0;
    int LowerBoundX = -1;
    int UpperBoundX = 1;
    int LowerBoundY = -1;
    int UpperBoundY = 1;
    if (X == 0) {
      LowerBoundX = 0;
    } else if (X/Height == Cols-1) {
      UpperBoundX = 0;
    }
    if (Y == 0) {
      LowerBoundY = 0;
    } else if (Y/Width == Rows-1) {
      UpperBoundY = 0;
    }
    for (int i = LowerBoundX; i <= UpperBoundX; i++) {
      for (int j = LowerBoundY; j <= UpperBoundY; j++) {
        if (AllCells[int(X/Width)+i][int(Y/Width)+j].Bomb == true) {
          Amount += 1;
        }
      }
    }
  }
  
  void FindNearZeroes(Cell AllCells[][]) {
    int LowerBoundX = -1;
    int UpperBoundX = 1;
    int LowerBoundY = -1;
    int UpperBoundY = 1;
    if (X == 0) {
      LowerBoundX = 0;
    } else if (X/Height == Cols-1) {
      UpperBoundX = 0;
    }
    if (Y == 0) {
      LowerBoundY = 0;
    } else if (Y/Width == Rows-1) {
      UpperBoundY = 0;
    }
    for (int i = LowerBoundX; i <= UpperBoundX; i++) {
      for (int j = LowerBoundY; j <= UpperBoundY; j++) {
        if (AllCells[int(X/Width)+i][int(Y/Width)+j].Revealed == false && AllCells[int(X/Width)+i][int(Y/Width)+j].Bomb == false) {
          AllCells[int(X/Width)+i][int(Y/Width)+j].Revealed = true;
          AllCells[int(X/Width)+i][int(Y/Width)+j].Colour = 200;
          if (AllCells[int(X/Width)+i][int(Y/Width)+j].Amount == 0) {
            AllCells[int(X/Width)+i][int(Y/Width)+j].FindNearZeroes(AllCells);
          }
        }
      }
    }
  
  }
  
  
  void Show(Cell AllCells[][]) {
    fill(Colour);
    rect(X,Y,Width,Height);
    if (Revealed == true && Bomb == true) {
      fill(0);
      ellipse(X+Width/2,Y+Width/2,Width/2,Height/2);
    } else if (Revealed == true && Bomb == false) {
      fill(0);
      textSize(Width);
      text(Amount,X+Width/4,Y+Width-Width/6);
      if (Amount == 0) {
        FindNearZeroes(AllCells);
      }
    }
  }
}
  
