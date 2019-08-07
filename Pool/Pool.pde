int Width = 1000;
int Height = 500;
int Border = 25;
int BallRadius = 10;
float Angle = 0;

Ball Balls[];
Cue CueBall;

void setup() {
  size(1050, 550);
  Setup();
}

void draw() {
  noStroke();
  background(#593711);
  pushMatrix();
  translate(Border, Border);
  fill(#3BA775);
  rect(0, 0, Width, Height);
  for (int i = 0; i < Balls.length; i++) {
    Balls[i].Show();
    Balls[i].Update();
    Balls[i].CheckWall();
  }
  CueBall.Show();
  CueBall.Update();
  CueBall.CheckWall();

  for (int i = 0; i < Balls.length; i++) {
    CueBall.CheckCollision(Balls[i]);
  }

  for (int i = 0; i < Balls.length; i++) {
    for (int j = i+1; j < Balls.length; j++) {
      Balls[i].CheckCollision(Balls[j]);
    }
  }
  boolean Shoot = true;
  if (CueBall.Velocity.mag() >= 0.02) {
    Shoot = false;
  }
  for (int i = 0; i < Balls.length; i++) {
    if (Balls[i].Velocity.mag() >= 0.02) {
      Shoot = false;
    }
  }
  if (Shoot) {
    Shooting();
  }
  popMatrix();
}


void Setup() {
  noStroke();
  ellipseMode(CENTER);
  Balls = new Ball[15];
  CueBall = new Cue(200, Height/2);

  Balls[0] = new Ball(Width-200-BallRadius*8, Height/2, "Red");
  Balls[1] = new Ball(Width-200-BallRadius*6, Height/2+BallRadius, "Yellow");
  Balls[2] = new Ball(Width-200-BallRadius*6, Height/2-BallRadius, "Red");
  Balls[3] = new Ball(Width-200-BallRadius*4, Height/2+BallRadius*2, "Red");
  Balls[4] = new Ball(Width-200-BallRadius*4, Height/2, "Black");
  Balls[5] = new Ball(Width-200-BallRadius*4, Height/2-BallRadius*2, "Yellow");
  Balls[6] = new Ball(Width-200-BallRadius*2, Height/2-BallRadius*3, "Red");
  Balls[7] = new Ball(Width-200-BallRadius*2, Height/2-BallRadius, "Yellow");
  Balls[8] = new Ball(Width-200-BallRadius*2, Height/2+BallRadius*3, "Yellow");
  Balls[9] = new Ball(Width-200-BallRadius*2, Height/2+BallRadius, "Red");
  Balls[10] = new Ball(Width-200-BallRadius, Height/2+BallRadius*4, "Red");
  Balls[11] = new Ball(Width-200-BallRadius, Height/2+BallRadius*2, "Yellow");
  Balls[12] = new Ball(Width-200-BallRadius, Height/2+BallRadius, "Red");
  Balls[13] = new Ball(Width-200-BallRadius, Height/2-BallRadius*2, "Yellow");
  Balls[14] = new Ball(Width-200-BallRadius, Height/2-BallRadius*4, "Yellow");
}

void Shooting() {
  float Angle = HALF_PI-atan2(mouseX-CueBall.Position.x,mouseY-CueBall.Position.y);
  stroke(0);
  line(CueBall.Position.x,CueBall.Position.y,CueBall.Position.x+50*cos(Angle),CueBall.Position.y+ 50*sin(Angle));
  if (mousePressed) {
    CueBall.Velocity = new PVector(20*cos(Angle),20*sin(Angle));
  }
}
