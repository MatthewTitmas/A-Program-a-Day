class Circle {
  PVector Position;
  PVector OriginalPos;
  float Radius;
  float Angle = random(TWO_PI);
  float XOff = random(-10, 10);
  float XOffAddition = random(0.1, 0.3);
  Circle(float XPos, float YPos, float radius) {
    Position = new PVector(XPos, YPos);
    OriginalPos = Position.copy();
    Radius = radius;
  }

  void Show() {
    noStroke();
    ellipse(Position.x, Position.y, Radius*2, Radius*2);
  }

  void Update() {
    {
      float OffSet = map(noise(XOff), 0, 1, -0.3, 0.3);
      Angle += OffSet;

      Position.x += cos(Angle);
      Position.y += sin(Angle);

      if (Position.x+Radius > OriginalPos.x+2*Radius || Position.x-Radius < OriginalPos.x-2*Radius) {
        Position.x -= cos(Angle);
      }

      if (Position.y+Radius > OriginalPos.y+2*Radius || Position.y-Radius < OriginalPos.y-2*Radius) {
        Position.y -= sin(Angle);
      }
      XOff += XOffAddition;
    }
  }
}
