class Circle {
  PVector Position;
  PVector Velocity;
  float Radius;
  Circle(float XPos, float YPos, float XVel, float YVel, float radius) {
    Position = new PVector(XPos, YPos);
    Velocity = new PVector(XVel, YVel);
    Radius = radius;
  }

  float GetDist(float x, float y) {
    return (Radius / dist(x, y, Position.x, Position.y));
  }

  void Update() {
    Position.add(Velocity);
    if (Position.x + Radius > width || Position.x - Radius < 0) {
      Velocity.x *= -1;
    }
    if (Position.y + Radius > height || Position.y - Radius < 0) {
      Velocity.y *= -1;
    }
  }
}
