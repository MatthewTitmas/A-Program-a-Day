class Wall {
  PVector StartPos;
  PVector EndPos;
  
  Wall(float X1, float Y1, float X2, float Y2) {
    StartPos = new PVector(X1,Y1);
    EndPos = new PVector(X2,Y2);
  }
  
  void Show() {
    stroke(255);
    line(StartPos.x,StartPos.y,EndPos.x,EndPos.y);
  }
}
