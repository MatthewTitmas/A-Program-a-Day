int SpaceBetweenPins = 50;
int AmountOfBalls = 200;
Pin[][] Pins;
Ball[] Balls;
int[] Distribution = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};


void setup() {
  colorMode(HSB);
  size(1200, 800);
  Pins = new Pin[16][16];
  Balls = new Ball[AmountOfBalls];
  int Extra = 0;
  int XCount = 0;
  int YCount = 0;
  for (int i = SpaceBetweenPins; i < width-400; i+= SpaceBetweenPins) {
    for (int j = SpaceBetweenPins; j < height; j+= SpaceBetweenPins) {
      Pins[XCount][YCount] = new Pin(i, j+Extra);
      YCount += 1;
    }
    XCount += 1;
    YCount = 0;
    Extra = (Extra+(SpaceBetweenPins/2)) % 50;
  }
  for (int i = 0; i < AmountOfBalls; i++) {
    Balls[i] = new Ball(400+random(-1, 1), 0);
  }
}

void draw() {
  background(0);
  fill(0, 0, 255);
  rect(width-400, 0, 400, height);
  int Maximum = 1;
  for (int i = 0; i < Distribution.length; i++) {
    if (Distribution[i] > Maximum) {
      Maximum = Distribution[i];
    }
  }
  for (int i = 0; i < Distribution.length; i++) {
    float XPos = map(i, 0, 16, width-350, width-50);
    float YPos = map(Distribution[i],0,Maximum,10,300);
    float Height = 350-YPos;
    fill(255, 255, 255);
    rect(XPos, Height, 10, YPos);
  }
  for (int i = 0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      Pins[i][j].Show();
    }
  }
  for (int i = 0; i < AmountOfBalls; i++) {
    Balls[i].Show();
    Balls[i].Update();
    for (int j = 0; j < 15; j++) {
      for (int k = 0; k < 15; k++) {
        Balls[i].CheckCollisionWithPin(Pins[j][k]);
      }
    }
  }
}
