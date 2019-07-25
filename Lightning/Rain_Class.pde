class Rain {
  PVector Position;
  
  Rain(float XPos, float YPos) {
    Position = new PVector(XPos,YPos);
  }
  
  void Show() {
    strokeWeight(1);
    stroke(255);
    point(Position.x,Position.y);
    Position.add(RainVelocity);
    if (Position.y > height) {
      Position.y = 0;
      Position.x = random(-width/2,width);
    }
  }
}
