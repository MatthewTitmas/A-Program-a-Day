float Attraction = 20;
Dot[] Dots;
int AmountOfDots;
boolean Col = false;

void setup() {
  fullScreen();
  AmountOfDots = 1000;
  Dots = new Dot[AmountOfDots];
  for (int i = 0; i < AmountOfDots; i++) {
    Dots[i] = new Dot(random(width), random(height), 2);
  }
  background(0);
}

void draw() {
  fill(0);
  rect(0,0,width,height);
  for (int i = 0; i < AmountOfDots; i++) {
    Dots[i].Show();
    Dots[i].Update();
  }
}

void mousePressed() {
  Col = !Col;
}
