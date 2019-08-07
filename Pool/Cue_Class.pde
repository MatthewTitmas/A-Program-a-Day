class Cue {
  PVector Position;
  PVector Velocity;
  float Radius;
  float Mass;

  Cue(float X, float Y) {
    Position = new PVector(X, Y);
    Velocity = new PVector(0, 0);
    Radius = BallRadius;
    Mass = 3;
  }

  void Show() {
    fill(255);
    ellipse(Position.x, Position.y, Radius*2, Radius*2);
  }

  void Update() {
    Position.add(Velocity);
    Velocity.mult(0.99);
  }

  void CheckCollision(Ball Colliding) {
    if (sq(Position.x-Colliding.Position.x) + sq(Position.y-Colliding.Position.y) <= sq(Radius+Colliding.Radius)) {
      float DistanceX = Colliding.Position.x-Position.x;
      float DistanceY = Colliding.Position.y-Position.y;
      float Dist = sqrt(DistanceX * DistanceX + DistanceY * DistanceY);
      float normalX = DistanceX / Dist;
      float normalY = DistanceY / Dist;
      float midpointX = (Position.x + Colliding.Position.x) / 2;
      float midpointY = (Position.y + Colliding.Position.y) / 2;
      Position.x = midpointX - normalX * Radius;
      Position.y = midpointY - normalY * Radius;
      Colliding.Position.x = midpointX + normalX * Colliding.Radius;
      Colliding.Position.y = midpointY + normalY * Colliding.Radius;
      float dVector = (Velocity.x - Colliding.Velocity.x) * normalX;
      dVector += (Velocity.y - Colliding.Velocity.y) * normalY;
      float dvx = dVector * normalX;
      float dvy = dVector * normalY;
      Velocity.x -= dvx;
      Velocity.y -= dvy;
      Colliding.Velocity.x += dvx;
      Colliding.Velocity.y += dvy;
    }
  }
  
  void CheckWall() {
    if (Position.x + Velocity.x - Radius < 0 || Position.x + Velocity.x + Radius > Width) {
      Velocity.x *= -1;
    }
    if (Position.y + Velocity.y - Radius < 0 || Position.y + Velocity.y + Radius > Height) {
      Velocity.y *= -1;
    }
  }
}
