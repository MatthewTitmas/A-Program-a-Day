class InputBox {
  PVector Position;
  float Width;
  float Height;
  int Value;
  boolean Selected;

  InputBox(float XPos, float YPos, float Width_, float Height_, int StartingValue) {
    Selected = false;
    Position = new PVector(XPos, YPos);
    Value = StartingValue;
    Width = Width_;
    Height = Height_;
  }

  void Show() {
    if (Selected) {
      stroke(#1C05F4);
    } else {
      stroke(0);
    }
    strokeWeight(3);
    fill(255);
    rect(Position.x, Position.y, Width, Height);
    textAlign(LEFT, CENTER);
    textSize(50);
    fill(0);
    text(Value, Position.x+10, Position.y+Height/2-5);
  }

  void Update() {
    if (Value > 999) {
      Value = 999;
    } else if (Value < 0) {
      Value = 0;
    }
  }
}
