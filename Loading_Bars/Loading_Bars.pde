int Percent;

BarOne FirstBar;
BarTwo SecondBar;
BarThree ThirdBar;
BarFour FourthBar;
BarFive FifthBar;

void setup() {
  size(600, 640);
  FirstBar = new BarOne(100, 20, 400, 50);
  SecondBar = new BarTwo(100, 90, 400, 50);
  ThirdBar = new BarThree(100, 160, 400, 20);
  FourthBar = new BarFour(width/2, 300, 100);
  FifthBar = new BarFive(width/2, 520, 80);
}

void draw() {
  background(0);
  if (random(1) > 0.3) {
    Percent++;
  }

  FirstBar.Update();
  FirstBar.Show();

  SecondBar.Show();
  SecondBar.Update();

  ThirdBar.Show();
  ThirdBar.Update();

  FourthBar.Show();
  FourthBar.Update();

  FifthBar.Show();
  FifthBar.Update();
}


void mouseClicked() {
  Percent = 0;
}
