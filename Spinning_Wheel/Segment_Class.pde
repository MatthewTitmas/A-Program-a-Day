class Segment {
  float PAngle;
  PVector Position1;
  PVector Position2;
  PVector Position3;

  Segment(float angle) {
    PAngle = angle;
    Position1 = new PVector(0, 0);
    Position2 = new PVector(Radius*cos(PAngle), Radius*sin(PAngle));
    Position3 = new PVector(Radius*cos(PAngle-radians(Angle)), Radius*sin(PAngle-radians(Angle)));
  }

  void Show() {
    float CurrentAngle = (PAngle + (Rotation % TWO_PI)) % TWO_PI;
    stroke(127);
    strokeWeight(1);
    fill(#033788);
    beginShape();
    vertex(Position1.x, Position1.y);
    vertex(Position2.x, Position2.y);
    vertex(Position3.x, Position3.y);
    endShape(CLOSE);
  }
}
