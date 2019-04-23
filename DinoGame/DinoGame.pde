Dinosaur Dino = new Dinosaur();
Obstacle[] Obstacles = new Obstacle[5];
Pebble[] Pebbles = new Pebble[20];
float Count = 0;

void setup() {
  size(1400,800);
  background(255);
  for (int x = 0; x < 5; x++) {
    Obstacles[x] = new Obstacle(width + x*600);
  }
  for (int x = 0; x < 20; x++) {
    Pebbles[x] = new Pebble();
  }
}

void draw() {
  background(255);
  line(0,550,width,550);
  Dino.Move();
  Dino.Show();
  for (Obstacle OBS : Obstacles) {
    OBS.Speed *= 1.0001;
    OBS.Draw();
    OBS.Move();
    if (Count > 300) {
      OBS.Reset();
      Count = 0;
    }
    Count += 1;
  }
  for (Pebble Peb : Pebbles) {
    Peb.Speed *= 1.0001;
    Peb.Draw();
    Peb.Move();
  }
}

void keyPressed() {
  if (Dino.YPos == 450) {
    if (key == char('c')) {
      Dino.YVel = 12;
    } else if (key == char('v')) {
      Dino.YVel = 10;
    } else if (key == char('b')) {
      Dino.Duck = true;
    }
  }
}

void keyReleased(){
  if (key == char('b')) {
    Dino.Duck = false;
  }
}
