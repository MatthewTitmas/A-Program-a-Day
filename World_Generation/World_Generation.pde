Block[][] Blocks;
int BlockWidth = 50;
Player Person;
int Gravity = 1;

void setup() {
  fullScreen();
  GenerateGround();
  Person = new Player(width/2, height/2);
}

void draw() {
  background(0, 0, 255);
  pushMatrix();
  for (int i = max(0, int(Person.Position.x/BlockWidth)-31); i < min(int(Person.Position.x/BlockWidth)+31, 999); i++) {
    for (int j = max(0, int(Person.Position.y/BlockWidth)-25); j < min(int(Person.Position.y/BlockWidth)+25, 199); j++) {
      Blocks[i][j].Show(int(Person.Position.x)-width/2, int(Person.Position.y));
    }
  }
  popMatrix();
  Person.Show();
  Person.Update();
}

void keyPressed() {
  if (key == 'a') {
    Person.Velocity.x = -3;
  } else if (key == 'd') {
    Person.Velocity.x = 3;
  } else if (key == 's') {
    Person.Velocity.y = 3;
  } else if (key == 'w') {
    Person.Velocity.y = -3;
  }
} 

void keyReleased() {
  if (key == 'a' || key == 'd') {
    Person.Velocity.x = 0;
  } else if (key == 's' || key == 'w') {
    Person.Velocity.y = 0;
  }
}


void GenerateGround() {
  Blocks = new Block[1000][200];
  int RandomY = 25;
  for (int i = 0; i < 1000; i++) {
    for (int j = 0; j < 200; j++) {
      if (j < RandomY) {
        if (Blocks[i][j] == null) {
          Blocks[i][j] = new Air(i*BlockWidth - 500, j*BlockWidth);
        }
      } else if (j != RandomY) {
        Blocks[i][j] = new Dirt(i*BlockWidth - 500, j*BlockWidth);
      } else {
        Blocks[i][j] = new Grass(i*BlockWidth - 500, j * BlockWidth);
        if (random(1) < 0.05) {
          AddTree(i, j);
        }
      }
    }
    if (random(1) < 0.2) {
      RandomY += round(random(-1, 1));
    }
  }
}

void AddTree(int x, int y) {
  int Height = floor(random(5, 15));
  for (int j = y-1; j >= max(0, y-Height); j--) {
    Blocks[x][j] = new Trunk(x*BlockWidth-500, j*BlockWidth);
  }
  for (int i = max(0, x-2); i < min(999, x+3); i++) {
    for (int j = max(0, y-Height-2); j < min(199, y-Height+2); j++) {
      if (Blocks[i][j] == null) {
        Blocks[i][j] = new Leaves(i*BlockWidth-500, j*BlockWidth);
      } else if (Blocks[i][j].Colour !=  color(#7C3D00)) {
        Blocks[i][j] = new Leaves(i*BlockWidth-500, j*BlockWidth);
      }
    }
  }
}
