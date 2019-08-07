Tree GreatOak;
float YOff;

void setup() {
  size(800, 800);
  GreatOak = new Tree(width/2, 625);
  GreatOak.GenerateTree();
}

void draw() {
  BackgroundGradient();
  GrassGradient();
  GreatOak.DrawTree();
}




void BackgroundGradient() {
  for (int i = 0; i <= height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(#3853AB, #9AB2C1, inter);
    stroke(c);
    line(0, i, width, i);
  }
}

void GrassGradient() {
  float Y = YOff;
  for (int i = 0; i < width; i++) {
    float Angle = map(i, 0, width, 0, PI);
    float Sin = sin(Angle);
    color c = lerpColor(#3E5E11, #607E22, Sin);
    stroke(c);
    line(i, 600-Sin*20+map(noise(Y), 0, 1, 0, 10), i, height);
    Y += 0.01;
  }
}

void mouseClicked() {
  GreatOak.GenerateTree();
  YOff = random(0, 1);
}
