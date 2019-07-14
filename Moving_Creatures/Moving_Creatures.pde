Creature[] Creatures;
float Angle = 4.2;
float AngleChange = 0.01;

void setup() {
  size(800, 800, P3D);
  Creatures = new Creature[10];
  for (int i = 0; i < Creatures.length; i++) {
    Creatures[i] = new Creature();
  }
}

void draw() {
  lights();
  background(127);
  translate(width/2, height/2);
  rotateX(Angle);
  translate(-width/2, -height/2);
  pushMatrix();
  translate(width/2, height/2, 30);
  rectMode(CENTER);
  fill(20);
  stroke(255);
  rect(0, 0, 1000000000, 1000000000);
  popMatrix();

  for (int i = 0; i < Creatures.length; i++) {
    Creatures[i].Show();
    Creatures[i].Update();
  }
  //Angle += AngleChange;
}

void mouseWheel(MouseEvent Event) {
  float e = float(Event.getCount())/10;
  println(e);
  Angle += e;
}
