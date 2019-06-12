class Snake {
  int TimesMoved = 20;
  int Fitness = 0;
  PVector Position;
  float Angle = PI/2;
  float AngleChange;
  float Velocity = 2;
  float Radius = 5;
  boolean Dead = false;
  Ray[] Rays;
  NeuralNetwork Brain;


  Snake(float XPos, float YPos) {
    Position = new PVector(XPos, YPos);
    Rays = new Ray[30];
    for (int x = 0; x < Rays.length; x++) {
      float Angle = map(x, 0, 29, 45, 135);
      Rays[x] = new Ray(radians(Angle));
    }
    Brain = new NeuralNetwork();
  }


  void Update() {
    if (Position.x - Radius < 0 || Position.y - Radius < 0 || Position.x + Radius > width || Position.y + Radius > height) {
      Dead = true;
    }
    float[] Distances = new float[30];
    for (int i = 0; i < Rays.length; i++) {
      Distances[i] = Rays[i].GetDistances(Position.x, Position.y)/(800*sqrt(2));
    }

    Matrix Result = Brain.ForwardPropogation(Matrix.Array(Distances));
    int Turn = Result.ShowMax();
    if (Turn == 0) {
      AngleChange = 0.1;
    } else if (Turn == 1) {
      AngleChange = -0.1;
    } else {
      AngleChange = 0;
    }

    for (int i = 0; i < Rays.length; i++) {
      Rays[i].Angle += AngleChange;
    }
    Angle += AngleChange;
    Position.x += Velocity*cos(Angle);
    Position.y += Velocity*sin(Angle);
    Fitness += Velocity;
  }

  void UpdatePixels(int Count) {
    for (int i = max(0, floor(Position.x-20)); i < min(width-1, floor(Position.x+20)); i++) {
      for (int j = max(0, floor(Position.y-20)); j < min(height-1, floor(Position.y+20)); j++) {
        if ((i-Position.x) * (i-Position.x) + (j-Position.y)*(j-Position.y) < Radius * Radius) {
          noStroke();
          if (TimesMoved % 90 > 20) {
            if (Pixels[i][j].Checked == true && Pixels[i][j].Hovered == false) {
              Dead = true;
            } else {
              Pixels[i][j].Checked = true;
              Pixels[i][j].Hovered = true;
              //if (Count == 0) {
                fill(#FFF454);
                ellipse(i, j, 1, 1);
              //}
            }
          }
        } else {
          Pixels[i][j].Hovered = false;
        }
      }
    }
    TimesMoved += 1;
  }

  void Dead() {
    TimesMoved = 20;
    Position.x = 50;
    Position.y = 50;
    Velocity = 2;
    Angle = PI/2;
    background(0);
    Dead = false;
    for (int i= 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        Pixels[i][j] = new Pixel();
      }
    }
    for (int x = 0; x < Rays.length; x++) {
      float Angle = map(x, 0, 29, 45, 135);
      Rays[x] = new Ray(radians(Angle));
    }
    //Brain.Weights1 = Matrix.Mutate(Brain.Weights1);
    //Brain.Weights2 = Matrix.Mutate(Brain.Weights2);
    //Brain.Weights3 = Matrix.Mutate(Brain.Weights3);
  }
}
