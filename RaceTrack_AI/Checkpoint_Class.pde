class Checkpoint {
  PVector Start;
  PVector End;
  int ID;
  
  Checkpoint(float x1, float y1, float x2, float y2, int Id) {
    Start = new PVector(x1,y1);
    End = new PVector(x2,y2);
    ID = Id;
  }
  
  void Show() {
    stroke(0);
    strokeWeight(2);
    line(Start.x,Start.y,End.x,End.y);
  }
}
