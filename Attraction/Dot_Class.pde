class Dot {
  PVector Position;
  PVector Velocity;
  PVector Acceleration;
  float Radius;
  color Colour;

  Dot(float X, float Y, float radius) {
    Position = new PVector(X, Y);
    Velocity = new PVector(0, 0);
    Acceleration = new PVector(0, 0);
    Radius = radius;
    Colour = color(255);
    blendMode(ADD);
  }

  void Show() {
    fill(Colour);
    ellipse(Position.x, Position.y, Radius*2, Radius*2);
  }

  void Update() {
    float DistanceSQ = sq(mouseX-Position.x) + sq(mouseY-Position.y);
    if (DistanceSQ > 25) {
      Acceleration = new PVector(Attraction*(mouseX-Position.x) / DistanceSQ, Attraction*(mouseY-Position.y) / DistanceSQ);
    }
    Velocity.add(Acceleration);
    Velocity.mult(0.95);
    Position.add(Velocity);
    Acceleration.mult(0);
    float r, g, b = 0;
    float Vel = dist(0, 0, Velocity.x, Velocity.y);
    if (Col) {
      r = map(Vel, 0, 5, 128, 255);
      g = map(Vel, 0, 5, 64, 255);
      b = map(Vel, 0, 5, 0, 255);
    } else {
      r = map(Vel, 0, 5, 0, 255);
      g = map(Vel, 0, 5, 64, 255);
      b = map(Vel, 0, 5, 128, 255);
    }
    Colour = color(r, g, b, 32);
  }
}
