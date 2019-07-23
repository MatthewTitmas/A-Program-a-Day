class BarTwo {
  PVector Position;
  float Width;
  float Percentage;
  float Height;

  BarTwo(float XPos, float YPos, float w, float h) {
    Position = new PVector(XPos, YPos);
    Width = w;
    Height = h;
  }

  void Show() {
    strokeWeight(1);
    for (int i = 0; i < 10; i++) {
      noFill();
      rect(Position.x+i*Width/9.5, Position.y, Width/20, Height);
    }
    for (int i = 0; i < Percentage; i++) {
      fill(255);
      rect(Position.x+i*Width/9.5, Position.y, Width/20, Height);
    }
  }

  void Update() {
    Percentage = map(Percent, 0, 100, 0, 10);
    if (Percentage > 10) {
      Percentage = 10;
    }
  }
}
