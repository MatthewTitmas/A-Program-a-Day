class Button {
  PVector Position;
  float Width;
  float Height;
  int Value;
  boolean Selected;

  Button(float X, float Y, float W, int value) {
    Position = new PVector(X, Y);
    Width = Height = W;
    Value = value;
  }

  void Show() {
    if (Selected) {
      fill(200);
    } else {
      fill(255);
    }
    strokeWeight(1);
    rect(Position.x, Position.y, Width, Height);
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(0);
    if (Value != -1 && Value != -2) {
      text(Value, Position.x+Width/2, Position.y+Height/2);
    } else if (Value == -1) {
      text("<--", Position.x+Width/2, Position.y+Height/2);
    } else {
      text("Enter", Position.x+Width/2, Position.y+Height/2);
    }
  }

  boolean Intersect(int X, int Y) {
    return (X >= Position.x && X <= Position.x+Width && Y >= Position.y && Y <= Position.y+Height);
  }
}
