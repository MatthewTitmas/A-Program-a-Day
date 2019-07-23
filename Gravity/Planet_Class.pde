class Planet {
  PVector Position;
  PVector Velocity;
  PVector Acceleration;
  PVector ToAdd;
  float Mass;
  float Radius;
  Planet(float XPos, float YPos, float XVel, float YVel, float mass) {
    Position = new PVector(XPos, YPos);
    Velocity = new PVector(XVel, YVel);
    Acceleration = new PVector(0, 0);
    ToAdd = new PVector(0, 0);
    Mass = mass;
    Radius = 2*Mass;
  }

  void Show() {
    noStroke();
    fill(255);
    ellipse(Position.x, Position.y, 10, 10);
  }

  void Update() {
    Position.y += Velocity.y;
    Position.x += Velocity.x;
  }

  void CalculateForces(Star Sun) {
    PVector Force = PVector.sub(Sun.Position, Position);
    float Distance = Force.mag();
    Force.normalize();
    float Strength  = (G * Mass * Sun.Mass) / (sq(Distance));
    Force.mult(Strength);
    Velocity.add(Force);
  }
}
