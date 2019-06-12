Pixel[][] Pixels;
Snake Player;


void setup() {
  frameCount = 20;
  size(800, 800);
  Pixels = new Pixel[width][height];
  for (int i= 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      Pixels[i][j] = new Pixel();
    }
  }
  Player = new Snake(50, 50);
  background(0);
}

void draw() {
  //Player.Show();
  Player.Update();
  //Player.CheckDeath(Pixels);
  Player.UpdatePixels();
}

void keyReleased() {
  if (key == 'a' || key == 'd') {
    Player.AngleChange = 0;
  }
}


void keyPressed() {
  if (key == 'a') {
    Player.AngleChange = -0.1;
  } else if (key == 'd') {
    Player.AngleChange = 0.1;
  }
}
