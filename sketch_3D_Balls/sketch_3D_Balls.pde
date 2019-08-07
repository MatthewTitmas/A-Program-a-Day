ArrayList<Ball> Balls;
float Gravity = 0.3;
float Radius = 7;

void setup() {
  size(800, 800);
  Balls = new ArrayList<Ball>();
  colorMode(HSB);
}

void draw() {
  if (mousePressed) {
    Balls.add(new Ball(mouseX, mouseY));
  }

  background(0);

  DrawFloor();

  for (int i = Balls.size()-1; i >= 0; i--) {
    Ball Current = Balls.get(i);
    Current.Show();
    Current.Update();
    if (Current.Position.y > Current.FinalY) {
      Current.Bounces += 1;
      Current.Velocity.y *= -1;
      if (Current.Bounces > 5) {
        Balls.remove(i); 
      }
    }
  }
}

void DrawFloor() {
  color FirstColour = color(180, 255, 64);
  color EndColour = color(180, 255, 128);
  for (int i = 0; i < 500; i++) {
    float Difference = map(i, 0, 500, -200, 200);
    float In = map(i, 0, 400, 0, 1);
    stroke(lerpColor(FirstColour, EndColour, In));
    line(Difference, height-i, width-Difference, height-i);
  }
}
