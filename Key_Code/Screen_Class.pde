class Screen {
  PVector Position;
  float Width;
  float Height;
  String Value;
  SevenSegment[] Sevens;

  Screen(float X, float Y, float W, float H) {
    Position = new PVector(X, Y);
    Width = W;
    Height = H;
    Value = "";
    Sevens = new SevenSegment[8];
    for (int i = 0; i < 8; i++) {
      Sevens[i] = new SevenSegment(Position.x+430 - i*60, Position.y, 50, 90);
    }
  }

  void Show() {
    strokeWeight(10);
    stroke(50);
    fill(0);
    rect(Position.x-10, Position.y-10, Width+10, Height+10);
    for (int i = 0; i < 8; i++) {
      if (Value.length() > i) {
        Sevens[i].Show(str(Value.charAt(i)));
      } else {
        Sevens[i].Show("Nope");
      }
    }
  }
}
