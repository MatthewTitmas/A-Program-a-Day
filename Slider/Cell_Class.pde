class Cell {
  PVector Position;
  int Number;
  boolean Possible;
  
  Cell(float XPos, float YPos, int No) {
    Position = new PVector(XPos,YPos);
    Number = No;
    Possible = false;
  }
  
  void Show() {
    fill(#b38c22);
    rect(Position.x*Spacing+5,Position.y*Spacing+5,Spacing-5,Spacing-5,5);
    fill(0);
    textSize(32);
    text(Number,Position.x*Spacing+Spacing/2-13,Position.y*Spacing+Spacing/2+10);
  }
}
