class Ship {
  PVector Position;
  float Rotation = PI;
  float StoredRotation;
  float RotationChange;
  float Acceleration;
  boolean Moving;

  Ship() {
    Position = new PVector(width/2, height/2);
  }

  void Update() {
    if (Position.x < -40) {
      Position.x = width+40;
    } else if (Position.x > width+40) {
      Position.x = -40;
    } else if (Position.y < -40) {
      Position.y = height+40;
    } else if (Position.y > height+40) {
      Position.y = -40;
    }
    Rotation += RotationChange;

    if (Moving) {
      Acceleration = 3;
      Position.x += -sin(Rotation)*Acceleration;
      Position.y += cos(Rotation)*Acceleration;
      StoredRotation = Rotation;
    } else {
      Position.x += -sin(StoredRotation)*Acceleration;
      Position.y += cos(StoredRotation)*Acceleration;
      Acceleration -= 0.05;
      if (Acceleration < 0) {
        Acceleration = 0;
      }
    }
  }

  void Show() {
    noFill();
    pushMatrix();
    translate(Position.x, Position.y);
    rotate(Rotation);
    stroke(255, 0, 0);
    stroke(255);
    beginShape();
    vertex(-20, -20);
    vertex(20, -20);
    vertex(0, 30);
    endShape(CLOSE);
    if (Moving) {
      beginShape();
      vertex(-10, -20);
      vertex(10, -20);
      vertex(0, -35);
      endShape(CLOSE);
    }
    popMatrix();
  }
}
