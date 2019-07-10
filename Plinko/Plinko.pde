int SpaceBetweenPins = 50;
int AmountOfBalls = 22;
Pin[][] Pins;
Ball[] Balls;


void setup() {
  colorMode(HSB);
  size(800, 800);
  Pins = new Pin[16][16];
  Balls = new Ball[AmountOfBalls];
  int Extra = 0;
  int XCount = 0;
  int YCount = 0;
  for (int i = SpaceBetweenPins; i < width; i+= SpaceBetweenPins) {
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
