class Box {
  boolean Orientation;
  float Width;
  float Height;
  PVector Position;
  // True = Vertical, False = Horizontal
  Box(String Orient, float Value1, float Value2, float X, float Y) {
    Position = new PVector(X,Y);
    if (Orient == "Vertical") {
      Orientation = true;
    } else {
       Orientation = false;
    }
    Height = Value2;
    Width = Value1;
    if (Orientation == false) {
      Height = Value1;
      Width = Value2;
    }    
  }
  
  void Show(boolean Result) {
    fill(255,0,0,50);
    if (Result == true) {
      fill(255,0,0);
    }
    rectMode(CENTER);
    noStroke();
    rect(Position.x,Position.y,Width,Height);
  }
}
