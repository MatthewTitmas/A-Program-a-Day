ArrayList<Segment> Wheel;
Lever Strength;
float Angle = 20;
float Radius = 300;
float Rotation;
float Velocity = 0.25;

void setup() {
  size(1000, 800);
  Strength = new Lever(100, 150, 50, 500);
  Wheel = new ArrayList<Segment>();
  for (int i = 0; i < 360; i+= Angle) {
    Wheel.add(new Segment(radians(i)));
  }
}

void draw() {
  background(0);
  Strength.Show();
  if (Strength.Selected && mouseY > Strength.Position.y && mouseY < Strength.Position.y+Strength.Height) {
    Velocity = Strength.MoveCircle(mouseY);
  }
  pushMatrix();
  translate(600, height/2);
  rotate(Rotation);
  for (Segment Current : Wheel) {
    Current.Show();
  }
  popMatrix();
  Rotation += Velocity;
  Velocity *= 0.99;
  fill(0, 0, 255);
  beginShape();
  vertex(600, 110);
  vertex(585, 80);
  vertex(615, 80);
  endShape(CLOSE);
}


void mouseReleased() {
  Strength.Selected = false;
}

void mousePressed() {
  if (Strength.Intersects(mouseX, mouseY)) {
    Strength.Selected = true;
  }
}
