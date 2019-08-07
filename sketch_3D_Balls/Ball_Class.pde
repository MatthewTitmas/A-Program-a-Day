class Ball {
  PVector Position;
  PVector Velocity;
  float FinalY;
  color Colour;
  int Bounces = 0;

  Ball(float X, float Y) {
    Position = new PVector(X, Y);
    Velocity = new PVector(random(-5, 5), -random(2, 10));
    FinalY = (height+Position.y)+Velocity.y*50;
    Colour = color(random(255), 255, 255);
  }

  void Show() {
    float Scale = map(FinalY, height-250, height, 0.5, 0.75);
    fill(Colour);
    stroke(Colour);
    ellipse(Position.x, Position.y, 2*Radius*Scale, 2*Radius*Scale);
    noFill();
    ellipse(Position.x, FinalY, 14*Radius*Scale, 6*Radius*Scale);
    noStroke();
    fill(0, 0, 255);
    ellipse(Position.x, FinalY, 2*Radius*Scale, 1*Radius*Scale);
  }

  void Update() {
    Position.add(Velocity);
    float Scale = map(FinalY, height-250, height, 0.5, 0.75);
    float Difference = map(FinalY, height, height-500, -200, 200);
    if (Position.x+Radius > width-Difference || Position.x - Radius < 0+Difference) {
      Velocity.x *= -1;
    }
    Velocity.y += Gravity;
    Velocity.y *= 0.99;
  }
}
