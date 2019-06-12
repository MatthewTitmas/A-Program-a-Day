class Cell {
  PVector Position;
  boolean Occupied;
  boolean Food = false;
  Cell(float x, float y) {
    Position = new PVector(x,y);
  }
  
  void Show() {
    fill(0,255,0);
    if (Food) {
      fill(255,0,0);
    }
    noStroke();
    rect(Position.x,Position.y,Spacing,Spacing);
  }
}
