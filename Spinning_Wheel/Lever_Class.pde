class Lever {
  PVector Position;
  float Width;
  float Height;
  float PAngle;
  float OldPAngle;
  boolean Selected;

  Lever(float X, float Y, float W, float H) {
    Position = new PVector(X, Y);
    Width = W;
    Height = H;
    PAngle = 30;
    Selected = false;
  }

  void Show() {
    fill(127);
    stroke(50);
    strokeWeight(15);
    rect(Position.x, Position.y, Width, Height);

    float CircleY = Position.y+Height/2+300*sin(radians(PAngle));
    float Mapped = 300*sin(radians(PAngle));
    float Radius;
    strokeWeight(7);
    stroke(25);
    line(Position.x+Width/2, Position.y+Height/2, Position.x+Width/2, CircleY);
    noStroke();
    fill(25);
    fill(255, 0, 0);
    if (Mapped >= 0) {
      Radius = map(Mapped, 0, 300, 60, 40);
    } else {
      Radius = map(Mapped, -300, 0, 40, 60);
    }
    ellipse(Position.x+Width/2, CircleY, Radius*2, Radius*2);
  }

  void Update() {
  }

  boolean Intersects(float X, float Y) {
    float CircleY = Position.y+Height/2+300*sin(radians(PAngle));
    float CircleX = Position.x+Width/2;
    float Radius;
    float Mapped = 300*sin(radians(PAngle));
    if (Mapped >= 0) {
      Radius = map(Mapped, 0, 300, 60, 40);
    } else {
      Radius = map(Mapped, -300, 0, 40, 60);
    }
    if (sq(X-CircleX) + sq(Y-CircleY) <= sq(Radius)) {
      return true;
    }
    return false;
  }
  
  float MoveCircle(float Y) {
    OldPAngle = PAngle;
    PAngle = degrees(asin((Y-(Position.y+Height/2))/(300)));
    float Difference = (OldPAngle-PAngle);
    if (Difference < 0) {
      return map(Difference,0,40,0,0.3);
    }
    return Velocity;
  };
}
