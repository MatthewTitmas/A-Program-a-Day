class Cell {
  PVector Position;
  String Value = null;

  Cell(float XPos, float YPos) {
    Position = new PVector(XPos, YPos);
  }

  void Show() {
    fill(#FFCF7E);
    stroke(#E8A866);
    strokeWeight(3);
    rect(Position.x, Position.y, Spacing, Spacing);
    if (Value != null) {
      textAlign(CENTER,CENTER);
      textSize(128);
      fill(0);
      text(Value,Position.x+Spacing/2,Position.y+Spacing/2);
    }
  }
}
