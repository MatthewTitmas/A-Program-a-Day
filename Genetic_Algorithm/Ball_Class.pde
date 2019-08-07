class Ball {
  PVector Position;
  float Radius;
  float StartingAngle;
  float Angle;
  float[] AngleChanges;
  PVector Velocity;
  boolean VelocityChange;
  boolean Moving;
  boolean Complete;
  int Fitness;

  Ball(float X, float Y, float radius, int Amount) {
    Position = new PVector(X, Y);
    Radius = radius;
    AngleChanges = new float[Amount];
    Angle = StartingAngle = random(-0.1, 0.1);
    for (int i = 0; i < Amount; i++) {
      AngleChanges[i] = random(-pow(10, -i)/100, pow(10, -i)/100);
    }
    Velocity = new PVector(3, 3);
    Moving = true;
    Complete = false;
  }

  void Show() {
    fill(#6BFFF6);
    ellipse(Position.x, Position.y, Radius*2, Radius*2);
  }

  void Update() {
    if (Moving) {
      Fitness++;
      VelocityChange = false;
      if (AngleChanges.length > 0) {
        Angle += AngleChanges[0];
      }
      Position.x += Velocity.x*cos(Angle);
      Position.y += Velocity.y*sin(Angle);
    }
    if (Position.x + Radius < 0 || Position.x - Radius > width || Position.y + Radius < 0 || Position.y - Radius > height) {
      Moving = false;
      if (Position.x-Radius > height) {
        Complete = true;
      }
    }
  }

  void Intersects(Obstacle Wall) {
    float D;
    float DX;
    float DY;    

    // Line 0:
    D = (Wall.Lines[0].Start.x-Position.x)*(Wall.Lines[0].End.y-Position.y) - (Wall.Lines[0].End.x-Position.x)*(Wall.Lines[0].Start.y-Position.y);
    DX = (Wall.Lines[0].End.x-Position.x) - (Wall.Lines[0].Start.x-Position.x);
    DY = (Wall.Lines[0].End.y-Position.y) - (Wall.Lines[0].Start.y-Position.y);
    if (sq(Radius)*(sq(DX)+sq(DY)) - sq(D) >= 0 && Position.x+Radius > Wall.Position.x && Position.x-Radius < Wall.Position.x + Wall.Width) {
      Velocity.y = 0;
      VelocityChange = true;
    } else if (VelocityChange == false) {
      Velocity.y = 3;
    }

    // Line 2:
    D = (Wall.Lines[2].End.x-Position.x)*(Wall.Lines[2].Start.y-Position.y) - (Wall.Lines[2].Start.x-Position.x)*(Wall.Lines[2].End.y-Position.y);
    DX = (Wall.Lines[2].Start.x-Position.x) - (Wall.Lines[2].End.x-Position.x);
    DY = (Wall.Lines[2].Start.y-Position.y) - (Wall.Lines[2].End.y-Position.y);
    if (sq(Radius)*(sq(DX)+sq(DY)) - sq(D) >= 0 && Position.x+Radius > Wall.Position.x && Position.x-Radius < Wall.Position.x + Wall.Width) {
      Velocity.y = 0;
      VelocityChange = true;
    } else if (VelocityChange == false) {
      Velocity.y = 3;
    }

    //Line 3:
    D = (Wall.Lines[3].End.x-Position.x)*(Wall.Lines[3].Start.y-Position.y) - (Wall.Lines[3].Start.x-Position.x)*(Wall.Lines[3].End.y-Position.y);
    DX = (Wall.Lines[3].Start.x-Position.x) - (Wall.Lines[3].End.x-Position.x);
    DY = (Wall.Lines[3].Start.y-Position.y) - (Wall.Lines[3].End.y-Position.y);
    if (sq(Radius)*(sq(DX)+sq(DY)) - sq(D) >= 0 && Position.y+Radius > Wall.Position.y && Position.y-Radius < Wall.Position.y + Wall.Height) {
      Velocity.x = 0;
      VelocityChange = true;
    } else if (VelocityChange == false) {
      Velocity.x = 3;
    }

    if (Velocity.x == 0 && Velocity.y == 0) {
      Velocity.y = 3;
    }
  }
}
