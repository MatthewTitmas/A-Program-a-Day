class Pin {
  PVector Position;
  float Radius;
  
  Pin(float XPos, float YPos) {
    Radius = 5;
    Position = new PVector(XPos,YPos);
  }
  
  void Show() {
    fill(0,0,127);
    noStroke();
    ellipse(Position.x,Position.y,Radius*2,Radius*2);
  }
}
