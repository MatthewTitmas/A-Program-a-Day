class Player {
  PVector Position = new PVector(100,100);
  PVector StartPos;
  int YChange;
  int XChange;
  
  void Move(color[][] Board) {
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Cols; j++) {
        if (Board[i][j] == #B4B5FE) {
          if (Position.y > 20 + j*40 && Position.x+30 > i*40 && Position.x < (i+1)*40 && Position.y < j*40 + 40) { // top
            if (YChange == 2) {
              YChange = 0;
            }
          } else if (Position.y < 90+j*40 && Position.x+30 > i*40 && Position.x < (i+1)*40 && Position.y > 50+j*40) { // bottom
            if (YChange == -2) {
              YChange = 0;
            }
          } if (Position.x-10> (i-1)*40 && Position.y+30 > 50 + j*40 && Position.y < 90 + j*40) { // left
            if (XChange == 2) {
              XChange = 0;
            }
          }
        }
      }
    }
    Position.x += XChange;
    Position.y += YChange;
     
  }
  
  void Update(int keyCode) {
    if (keyCode == 87) {
      YChange = -2; //Up
    } else if (keyCode == 65) {
      XChange = -2; //Left
    } else if (keyCode == 68) {
      XChange = 2;  //Right
    } else if (keyCode == 83) {
      YChange = 2;  //Left
    } 
  }
  
  void CheckCollision(color[][] Board) {
    for (int i = 0; i < Rows; i++) {
      for (int j = 0; j < Cols; j++) {
        if (Board[i][j] == #B5FEB5) {
          if (RectRectIntersect(i*40,50+j*40,i*40+40,90+j*40,Position.x,Position.y,Position.x+30,Position.y+30) == true) {
            Position.x = StartPos.x;
            Position.y = StartPos.y;
          }
        }
      }
    }
  }
    
  boolean RectRectIntersect(float left, float top, float right, float bottom, 
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
} 
