ArrayList<Obstacle> Obstacles;
Ball[] Balls;
int AmountOfBalls = 50;

void setup() {
  size(800, 800);
  Obstacles = new ArrayList<Obstacle>();
  Obstacles.add(new Obstacle(3*width/8, 0, width/15, 3*height/8));
  Obstacles.add(new Obstacle(3*width/8, width-3*height/8, width/15, 3*height/8));
  Obstacles.add(new Obstacle(5*width/8, height/2-height/8, width/15, height/4));
  //Obstacles.add(new Obstacle(7*width/8, 0, width/15, 3*height/8));
  //Obstacles.add(new Obstacle(7*width/8, width-3*height/8, width/15, 3*height/8));
  Balls = new Ball[AmountOfBalls];
  for (int i = 0; i < AmountOfBalls; i++) {
    Balls[i] = new Ball(width/8, height/2, 12, 1);
  }
}

void draw() {
  background(0);
  for (Obstacle Current : Obstacles) {
    Current.Show();
  }

  for (int i = 0; i < AmountOfBalls; i++) {
    Balls[i].Show();
    Balls[i].Update();
  }

  for (int i = 0; i < AmountOfBalls; i++) {
    for (Obstacle Current : Obstacles) {
      Balls[i].Intersects(Current);
    }
  }

  boolean Evolve = true;
  for (int i = 0; i < AmountOfBalls; i++) {
    if (Balls[i].Moving == true) {
      Evolve = false;
    }
  }

  if (Evolve) {
    EvolveBalls();
  }
}


void EvolveBalls() {
  int FittestIndex = 0;
  for (int i = 0; i < AmountOfBalls; i++) {
    if (Balls[i].Complete) {
      FittestIndex = i;
      break;
    }
  }
  float FittestAngle = 0;
  float FittestAngleChange = 0;
  for (int i = 0; i < AmountOfBalls; i++) {
    if (Balls[i].Fitness < Balls[FittestIndex].Fitness && Balls[i].Complete) {
      FittestIndex = i;
      FittestAngle = Balls[i].StartingAngle;
      FittestAngleChange = Balls[i].AngleChanges[0];
    }
  }
  
  for (int i = 0; i < AmountOfBalls; i++) {
    Balls[i].Complete = false;
    Balls[i].Fitness = 0;
    Balls[i].Position = new PVector(width/8,height/2);
    Balls[i].Velocity = new PVector(3,3);
    Balls[i].Moving = true;
    Balls[i].Angle = (Balls[i].Angle+FittestAngle)/2 + random(-0.01,0.01);
    Balls[i].AngleChanges[0] = (Balls[i].AngleChanges[0]+FittestAngleChange)/2 + random(-0.0001,0.0001);
    
  }
}
