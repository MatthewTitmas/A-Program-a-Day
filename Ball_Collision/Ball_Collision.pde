Ball[] Balls;

void setup() {
  size(800, 800);
  Balls = new Ball[10];
  for (int i = 0; i < Balls.length; i++) {
    Balls[i] = new Ball(random(50, width-50), random(50, height-50));
  }
}

void draw() {
  background(0);
  CheckIntersects();
  for (int i = 0; i < Balls.length; i++) {
    Balls[i].Show();
    Balls[i].Update();
  }
}

void CheckIntersects() {
  for (int i = 0; i < Balls.length; i++) {
    for (int j = i+1; j < Balls.length; j++) {
      if (Balls[i].CheckIntersect(Balls[j])) {
        if (dist(Balls[i].Position.x, Balls[i].Position.y, Balls[j].Position.x, Balls[j].Position.y) > dist(Balls[i].Position.x+Balls[i].XChange, Balls[i].Position.y+Balls[i].YChange, Balls[j].Position.x+Balls[j].XChange, Balls[j].Position.y+Balls[j].YChange)) {
          Balls[i].CalculateVelocity(Balls[j]);
        }
      }
    }
  }
}
