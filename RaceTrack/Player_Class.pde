class Player {
  PVector Position;
  float Width;
  float Length;
  float Angle = PI/2;
  float AngleChange;
  float Velocity;
  ArrayList<Ray> Rays;

  Player(float X, float Y, float L, float W) {
    Rays = new ArrayList<Ray>();
    Position = new PVector(X+10, Y);
    Width = W;
    Length = L;
    for (int i = 0; i < 3; i++) {
      float Angle = radians(i*90);
      Rays.add(new Ray(Position.x, Position.y, Angle));
    }
  }

  void Show() {
    imageMode(CENTER);
    rectMode(CENTER);
    pushMatrix();
    translate(Position.x, Position.y);
    rotate(Angle);
    image(CarImage, 0, 0);
    noFill();
    rect(0, 0, Width, Length);
    popMatrix();
    fill(0);
    for (Ray Current : Rays) {
      PVector Point = new PVector(0,0);
      float Distance = 100000;
      for (Wall Boundary : Walls) {
        PVector Test = Current.Cast(Boundary);
        if (Test != null) {
          if (Distance > dist(Test.x,Test.y,Position.x,Position.y)) {
            Distance = dist(Test.x,Test.y,Position.x,Position.y);
            if (Distance < 20) {
              Reset();
            }
            Point = Test.copy();
          }
        }
      }
      stroke(255);
      line(Position.x,Position.y,Point.x,Point.y);
    }
  }

  void Update() {
    Angle += AngleChange;
    Position.x += Velocity*cos(Angle);
    Position.y += Velocity*sin(Angle);
    for (Ray Current : Rays) {
      Current.Angle += AngleChange;
      Current.Position.x += Velocity*cos(Angle);
      Current.Position.y += Velocity*sin(Angle);
    }
  }
  
  void Reset() {
    Position.x = 325;
    Position.y = 0;
    Angle = PI/2;
    for (int i = 0; i < 3; i++) {
      float TempAngle = radians(i*90);
      Ray Current = Rays.get(i);
      Current.Position = Position.copy();
      Current.Angle = TempAngle;
    }
  }
}
