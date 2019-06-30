class Wall {
  PVector Start;
  PVector End;
  boolean Enabled;
  Wall(float StartX, float StartY, float EndX, float EndY) {
    Start = new PVector(StartX, StartY);
    End = new PVector(EndX, EndY);
    Enabled = true;
  }
  
  void Show() {
    stroke(0);
    strokeWeight(3);
    line(Start.x,Start.y,End.x,End.y);
  }
}
