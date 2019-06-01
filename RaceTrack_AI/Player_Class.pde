class Player {
  boolean Selected = false;
  PVector Position;
  float Width;
  float Length;
  float Angle = PI/2;
  float AngleChange;
  float Velocity;
  ArrayList<Ray> Rays;
  boolean Dead = false;

  float DistanceLeft;
  float DistanceRight;
  float DistanceInfront;
  NeuralNetwork Brain;

  Player(float X, float Y, float W, float L) {
    Rays = new ArrayList<Ray>();
    Position = new PVector(X, Y);
    Width = L;
    Length = W;
    for (int i = 0; i < 3; i++) {
      float Angle = radians(i*90);
      Rays.add(new Ray(Position.x, Position.y, Angle));
    }
    Brain = new NeuralNetwork();
  }


  void Show() {
    imageMode(CENTER);
    rectMode(CENTER);
    pushMatrix();
    translate(Position.x, Position.y);
    rotate(Angle);
    image(CarImage, 0, 0);
    if (Selected) {
      noFill();
      rect(0, 0, Width, Length);
    }
    popMatrix();
    fill(0);
    int Count = 0;
    for (Ray Current : Rays) {
      PVector Point = new PVector(0, 0);
      float Distance = 100000;
      for (Wall Boundary : Walls) {
        PVector Test = Current.Cast(Boundary);
        if (Test != null) {
          if (Distance > dist(Test.x, Test.y, Position.x, Position.y)) {
            Distance = dist(Test.x, Test.y, Position.x, Position.y);
            if (Distance < 20) {
              Dead = true;
            }
            Point = Test.copy();
          }
        }
      }
      if (Count == 0) {
        DistanceLeft = Distance;
      } else if (Count == 1) {
        DistanceInfront = Distance;
      } else if (Count == 2) {
        DistanceRight = Distance;
      }
      Count++;
      //stroke(255);
      //line(Position.x,Position.y,Point.x,Point.y);
    }
  }

  void Update() {
    float[] InputArray = new float[3];
    InputArray[0] = DistanceLeft;
    InputArray[1] = DistanceInfront;
    InputArray[2] = DistanceRight;
    Matrix Input = Matrix.Array(InputArray);
    Matrix Result = Brain.ForwardPropogation(Input);
    int Choice = Result.ShowMax();
    if (Choice == 0) {
      Velocity = 6;
      AngleChange = 0;
    } else if (Choice == 1) {
      Velocity = -4;
      AngleChange = 0;
    } else if (Choice == 2){
      Velocity = 0;
      AngleChange = 0.05;
    } else {
      Velocity = 0;
      AngleChange = -0.05;
    }

    Angle += AngleChange;
    Position.x += Velocity*cos(Angle);
    Position.y += Velocity*sin(Angle);
    for (Ray Current : Rays) {
      Current.Angle += AngleChange;
      Current.Position.x += Velocity*cos(Angle);
      Current.Position.y += Velocity*sin(Angle);
    }
  }

  void CheckClicked(float MouseX, float MouseY) {
    if (MouseX > Position.x-Width/2 && MouseX < Position.x+Width/2 && MouseY > Position.y-Length/2 && MouseY < Position.y+Length/2) {
      Selected = !Selected;
    }
  }

  void Reset() {
    Position = new PVector(325, 10);
    Angle = PI/2;
    for (int i = 0; i < 3; i++) {
      float NewAngle = radians(i*90);
      Ray Current = Rays.get(i);
      Current.Angle = NewAngle;
      Current.Position = new PVector(325,10);
    }
    Dead = false;
    Selected = false;
  }
}
