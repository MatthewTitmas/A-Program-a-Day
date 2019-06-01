class Player {
  float DistanceTraveled;
  int PipesPassed = 0;
  float YPos = height/2;
  float XPos = 50;
  float YVel = 0;
  float YAcc = 0.7;
  float Radius = 25;
  float Rotation;
  float DistanceToPipe;
  float DistanceFromGap;
  boolean Dead = false;
  NeuralNetwork Brain;

  Player() {
    Brain = new NeuralNetwork();
  }


  void Show() {
    imageMode(CENTER);
    pushMatrix();
    translate(XPos, YPos);
    rotate(radians(Rotation));
    image(Bird, 0, 0, 50, 50);
    popMatrix();
    //line(XPos, YPos, XPos+DistanceToPipe, YPos+DistanceFromGap);
  }

  void Update(Pipe[] Pipes) {
    DistanceTraveled += RateOfChange;
    float[] InputArray = new float[2];
    InputArray[0] = DistanceToPipe;
    InputArray[1] = DistanceFromGap;
    Matrix Input = Matrix.Array(InputArray);
    Matrix Output = Brain.ForwardPropogation(Input);
    if (Output.Values[0][0] > 0.5) {
      YVel = -10;
    }


    YPos += YVel;
    YVel += YAcc;
    Rotation = constrain(map(YVel, -10, 10, -45, 45), -45, 45);
    DistanceToPipe = 1000;
    DistanceFromGap = 1000;
    for (int i = 0; i < Pipes.length; i++) {
      float Distance = Pipes[i].XPos+Pipes[i].Width - XPos;

      if (Distance < DistanceToPipe && Distance > -10) {
        DistanceToPipe = Distance;
        DistanceFromGap = (Pipes[i].Height + Pipes[i].GapSize/2) - YPos;
      }
    }
  }

  void CheckDeath(Pipe[] Pipes) {
    if (YPos + Radius > height-62 || YPos - Radius < 0) {
      Dead= true;
    }
    for (int i = 0; i < Pipes.length; i++) {
      float DeltaX = XPos - max(Pipes[i].Rect1.x, min(XPos, Pipes[i].Rect1Width.x + Pipes[i].Rect1.x));
      float DeltaY = YPos - max(Pipes[i].Rect1.y, min(YPos, Pipes[i].Rect1Width.y + Pipes[i].Rect1.y));
      if ((DeltaX * DeltaX) + (DeltaY * DeltaY) < Radius * Radius) {
        Dead= true;
      }
      DeltaX = XPos - max(Pipes[i].Rect2.x, min(XPos, Pipes[i].Rect2Width.x + Pipes[i].Rect2.x));
      DeltaY = YPos - max(Pipes[i].Rect2.y, min(YPos, Pipes[i].Rect2Width.y + Pipes[i].Rect2.y));
      if ((DeltaX * DeltaX) + (DeltaY * DeltaY) < Radius * Radius) {
        Dead= true;
      }
    }
  }

  void Reset() {
    PipesPassed = 0;
    YPos = height/2;
    XPos = 50;
    YVel = 0;
    YAcc = 0.7;
    Dead = false;
    DistanceTraveled = 0;
  }
}
