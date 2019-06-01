PShape OuterTrack;
PShape InnerTrack;
PImage CarImage;
ArrayList<Checkpoint> Checkpoints;
ArrayList<Wall> Walls;
Player Car;

void setup() {
  PVector OuterTempStart = null;
  PVector OuterTempEnd = null;
  PVector OuterFinal = null;
  PVector InnerTempStart = null;
  PVector InnerTempEnd = null;
  PVector InnerFinal = null;
  CarImage = loadImage("Car.png");
  Car = new Player(325, 0, 40, 80);
  Checkpoints = new ArrayList<Checkpoint>();
  Walls = new ArrayList<Wall>();
  size(900, 900);
  OuterTrack = createShape();
  InnerTrack = createShape();
  OuterTrack.beginShape();
  InnerTrack.beginShape();
  OuterTrack.fill(#966C40);
  InnerTrack.fill(#21E758);
  OuterTrack.noStroke();
  InnerTrack.noStroke();
  int ID = 0;
  for (float x = 0; x < TWO_PI; x += 0.5) {
    float XRandom = random(-50, 50);
    float YRandom = random(-50, 50);
    float OuterX = (400+XRandom)*cos(x);
    float OuterY = (400+YRandom)*sin(x);
    float InnerX = (250+XRandom)*cos(x);
    float InnerY = (250+YRandom)*sin(x);
    OuterTrack.vertex(OuterX, OuterY);
    if (OuterTempStart != null) {
      OuterTempEnd = OuterTempStart.copy();
      InnerTempEnd = InnerTempStart.copy();
    }
    OuterTempStart = new PVector(OuterX, OuterY);
    InnerTempStart = new PVector(InnerX, InnerY);
    InnerTrack.vertex(InnerX, InnerY);
    Checkpoints.add(new Checkpoint(OuterX, OuterY, InnerX, InnerY, ID));
    if (OuterTempEnd != null) {
      Walls.add(new Wall(OuterTempStart.x, OuterTempStart.y, OuterTempEnd.x, OuterTempEnd.y));
      Walls.add(new Wall(InnerTempStart.x, InnerTempStart.y, InnerTempEnd.x, InnerTempEnd.y));
    } else {
      OuterFinal = new PVector(OuterX, OuterY);
      InnerFinal = new PVector(InnerX, InnerY);
    }
    ID += 1;
  }
  Walls.add(new Wall(OuterTempStart.x, OuterTempStart.y, OuterFinal.x, OuterFinal.y));
  Walls.add(new Wall(InnerTempStart.x, InnerTempStart.y, InnerFinal.x, InnerFinal.y));
  OuterTrack.endShape();
  InnerTrack.endShape();
  println("Track Made");
}

void draw() {
  translate(width/2, height/2);
  background(#21E758);
  shape(OuterTrack, 0, 0);
  shape(InnerTrack, 0, 0);
  for (Checkpoint Current : Checkpoints) {
    Current.Show();
  }
  Car.Show();
  Car.Update();
}


void keyReleased() {
  if (key == 'a' || key == 'd') {
    Car.AngleChange = 0;
  } else if (key == 'w' || key == 's') {
    Car.Velocity = 0;
  }
}

void keyPressed() {
  if (key == 'a') {
    Car.AngleChange = -0.05;
  } else if (key == 'd') {
    Car.AngleChange = 0.05;
  } else if (key == 'w') {
    Car.Velocity = 6;
  } else if (key == 's') {
    Car.Velocity = -3;
  }
}
