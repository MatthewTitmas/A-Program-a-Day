float StickLength = 50;
int NeedlesDropped = 0;
int Intersects = 0;
boolean NotLooping = false;
int Rate = 100;

void setup() {
  size(1000, 800);
  background(255);
  for (int i = 100; i < 800; i+= 100) {
    stroke(255, 0, 0);
    strokeWeight(3);
    line(0, i, width-200, i);
  }
}

void draw() {
  for (int i = 0; i < Rate; i++) {
    NeedlesDropped += 1;
    DropNeedle();
  }
  strokeWeight(1);
  stroke(255);
  fill(255);
  rect(width-200, 0, width, height);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(16);
  text("Needles Dropped:", width-100, 75);
  textSize(32);
  text(NeedlesDropped, width-100, 100);
  double Pi = (2*StickLength*NeedlesDropped)/(Intersects*100);
  text(Double.toString(Pi), width-200, 300, 200, 100);
}

void DropNeedle() {
  PVector Start = new PVector(random(0, width-200), random(50, height-50));
  float Angle = random(0, TWO_PI);
  PVector End = new PVector(Start.x+cos(Angle)*StickLength, Start.y+sin(Angle)*StickLength);
  stroke(floor(random(0, 256)), floor(random(0, 256)), floor(random(0, 256)));
  line(Start.x, Start.y, End.x, End.y);
  if (int(Start.y / 100) != int(End.y / 100)) {
    Intersects += 1;
  }
}

void mouseClicked() {
  if (NotLooping) {
    loop();
  } else {
    noLoop();
  }
  NotLooping = !NotLooping;
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  Rate += e*100;
  if (Rate < 100) {
    Rate = 100;
  }
}
