class Point {
  PVector Position;
  Point(float XPos, float YPos) {
    Position = new PVector(XPos,YPos);
  }
  
  void Show() {
    ellipse(Position.x,Position.y,5,5);
  }
}
