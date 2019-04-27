Line[] Firework = new Line[15];


void setup() {
  fullScreen();
  background(30);
  for (int x = 0; x < 15; x++) {
    Firework[x] = new Line();
  }
}

void draw() {
  background(5);
  for (Line Fire : Firework) {
    Fire.Draw();
  }
  

  
}
