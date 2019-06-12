class Ball {
  PVector Position;
  int Radius;
  float XChange;
  float YChange;
  float Mass;
  float Friction;

  Ball(float XPos, float YPos) {
    Position = new PVector(XPos, YPos);
    Radius = 30;
    Mass = random(5,10);
    XChange = random(-3,3);
    YChange = random(-3,3);
    Friction = 0.999;
  }

  void Show() {
    float Red = map(255/Mass,51,25.5,205,50);
    fill(Red,Red,Red);
    ellipse(Position.x, Position.y, Radius*2, Radius*2);
  }

  void Update() {
    XChange *= Friction;
    YChange *= Friction;
    if (Position.x + Radius > width || Position.x - Radius < 0) {
      XChange *= -1;
    }     
    if (Position.y + Radius > height || Position.y - Radius < 0) {
      YChange *= -1;
    }
    Position.x += XChange;
    Position.y += YChange;
  }

  boolean CheckIntersect(Ball Second) {
    float xd = Position.x - Second.Position.x;
    float yd = Position.y - Second.Position.y;

    float sumRadius = Radius + Second.Radius;
    float sqrRadius = sumRadius * sumRadius;

    float distSqr = (xd * xd) + (yd * yd);

    if (distSqr <= sqrRadius) {
      return true;
    }
    return false;
  }

  void CalculateVelocity(Ball Second) { 
    PVector Velocity1 = new PVector(XChange, YChange);
    PVector Velocity2 = new PVector(Second.XChange, Second.YChange); 
    PVector UNormal = PVector.sub(Position, Second.Position);
    UNormal.normalize();
    PVector UTangent = new PVector(-UNormal.y, UNormal.x);
    float V1n = PVector.dot(UNormal, Velocity1);
    float V1t = PVector.dot(UTangent, Velocity1);
    float V2n = PVector.dot(UNormal, Velocity2);
    float V2t = PVector.dot(UTangent, Velocity2);

    float V1After = ((V1n * (Mass-Second.Mass) + (2*Second.Mass*V2n))/(Mass+Second.Mass));
    float V2After = ((V2n * (Second.Mass-Mass) + (2*Mass*V1n))/(Mass+Second.Mass));

    PVector ToAddV1N = PVector.mult(UNormal, V1After);
    PVector ToAddV1T = PVector.mult(UTangent, V1t);

    PVector ToAddV2N = PVector.mult(UNormal, V2After);
    PVector ToAddV2T = PVector.mult(UTangent, V2t);

    XChange = ToAddV1N.x + ToAddV1T.x;
    YChange = ToAddV1N.y + ToAddV1T.y; 

    Second.XChange = ToAddV1N.x + ToAddV1T.x;
    Second.YChange = ToAddV2N.y + ToAddV2T.y;
    
    //while (dist(Position.x,Position.y,Second.Position.x,Second.Position.y) < Radius + Second.Radius) {
    //  Update();
    //  Second.Update();
    //}
  }
}
