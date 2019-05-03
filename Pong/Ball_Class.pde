class Ball {
  float XPos;
  float YPos;
  float Diameter = 30;
  float Radius = Diameter/2;
  float YChange = random(-10,10);
  float XChange = random(-10,10);
  int PlayerOnePoints = 0;
  int PlayerTwoPoints = 0;
  
  Ball(float X, float Y) {
    XPos = X;
    YPos = Y;
  }
  
  void Show() {
    ellipse(XPos,YPos,Diameter,Diameter);
    YPos += YChange;
    XPos += XChange;
  }
  
  void Walls() {
    if (YPos + Radius > height || YPos - Radius < 0) {
      YChange *= -1;
    }
  }
  
  void CollideWithPaddles(float LeftPaddleY, float RightPaddleY, float Width, float Height) {
    if (XPos - Radius < Width && YPos - Radius > LeftPaddleY && YPos + Radius < LeftPaddleY + Height) {
      XChange *= -1.2;
    } else if (XPos + Radius > width-Width && YPos - Radius > RightPaddleY && YPos + Radius < RightPaddleY + Height) {
      XChange *= -1;
    }
  }
  
  void CheckPoint() {
    if (XPos + Radius > width-5) {
      PlayerOnePoints += 1;
      YChange = random(-10,10);
      XChange = random(-10,10);
      XPos = width/2;
      YPos = height/2;
    } else if (XPos - Radius < 5) {
      PlayerTwoPoints += 1;
      YChange = random(-10,10);
      XChange = random(-10,10);
      XPos = width/2;
      YPos = height/2;
    }
  }
  
  void ShowPoints() {
    textSize(30);
    text(PlayerOnePoints,40,30);
    text(PlayerTwoPoints,width-60,30);
  }
}
