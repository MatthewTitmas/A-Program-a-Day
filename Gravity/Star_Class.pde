class Star {
  PVector Position;
  float Mass;
  Star(float XPos, float YPos, float mass) {
    Position = new PVector(XPos,YPos);
    Mass = mass;
  }
  
  void Show() {
    fill(255,255,0);
    ellipse(Position.x,Position.y,75,75);
  }
}
