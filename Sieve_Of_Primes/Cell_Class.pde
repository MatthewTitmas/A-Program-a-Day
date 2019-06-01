class Cell {
  PVector Position;
  int Value;
  float Spacing;
  boolean Prime = true;
  
  Cell(float x, float y, int number, float spacing) {
    Position = new PVector(x,y);
    Value = number;
    Spacing = spacing;
  }
  
  void Show(float ExtraX, float ExtraY) {
    fill(255,0,0);
    if (Prime) {
      fill(50,255,30);
    }
    rect(Position.x+ExtraX,Position.y+ExtraY,Spacing,Spacing);
    fill(0);
    text(Value,Position.x+ExtraX+Spacing/2,Position.y+ExtraY+Spacing/2);
  }
  
}
